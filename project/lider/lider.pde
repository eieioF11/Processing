//VScode Ctrl+shift+bで実行
import processing.serial.*;
Serial myPort;
/*field size*/
public static final int fx = 1000;
public static final int fy = 1000;
/*Grid size*/
public static final int grid = 125;


void field()
{
	background(0);//255
	//グリッド描画
	strokeWeight(1);
	stroke(100,100,100);
	for(int i=0;i<fx;i+=grid)
		line(i,0,i,fy);
	for(int i=0;i<fy;i+=grid)
		line(0,i,fx,i);
	//中心線描画
	strokeWeight(2);
	stroke(255,255,255);
	line(0,(int)(fy / 2),fx,(int)(fy / 2));
	stroke(255,255,255);
	line((int)(fx / 2),0,(int)(fx / 2),fy);
}
void setup()
{
	size(1000,1000);
	//接続可能なシリアルポートのリストを表示
	for (int i = 0; i < Serial.list().length; i++)
	{
		println(Serial.list()[i]);
	}
	//myPort = new Serial (this, Serial.list ()[1],115200);
	field();
	//myPort = new Serial(this, "COM8", 115200);//home COM4 note COM15
	myPort = new Serial(this, "COM6", 115200);//home COM4 note COM15
}

byte[][] fielddata = new byte[fx + 1][fy + 1];
byte[][] fielddata_ = new byte[fx + 1][fy + 1];
void CopyArray_float(float array1[][],float array2[][],int x,int y)
{
	for(int i=0;i<x;i++)
	{
		for(int j=0;j<y;j++)
		{
			array1[i][j]=array2[i][j];
		}
	}
}
void CopyArray_byte(byte array1[][],byte array2[][],int x,int y)
{
	for(int i=0;i<x;i++)
	{
		for(int j=0;j<y;j++)
		{
			array1[i][j]=array2[i][j];
		}
	}
}
void clean(byte field[][])
{
	for (int i = 0;i < fx;i++)
	{
		for (int j = 0;j < fy;j++)
		{
			field[i][j] = 0;
		}
	}
}
boolean rflag=false;
void save(int x_,int y_,boolean start)
{
	if(start)
	{
		if(!rflag)
		{
			CopyArray_byte(fielddata_,fielddata,fx+1,fy+1);
			CopyArray_float(preCov,Cov,8,8);
			clean(fielddata);
			rflag=true;
		}
	}
	else
		rflag=false;
	int indexX = x_ + (int)(fx / 2);
	int indexY = y_ + (int)(fy / 2);
	if (indexX > fx)indexX = fx;
	if (indexY > fy)indexY = fy;
	if (indexX < 0)indexX = 0;
	if (indexY < 0)indexY = 0;
	fielddata[indexX][indexY] = 1;
}
void print()
{
	strokeWeight(3);
	for (int i = 0;i < fx;i++)
	{
		for (int j = 0;j < fy;j++)
		{
			if (fielddata[i][j]!= 0)
			{
				stroke(255,0,0);
				point(i,j);
			}
			if (fielddata_[i][j]!= 0)
			{
				stroke(0,255,0);
				point(i,j);
			}
		}
	}
}
void gaze()
{
	strokeWeight(1);
	stroke(0,50,100);
	int sx = (int)(cos(radians((float)angle)) * 1000);
	int sy = (int)(sin(radians((float)angle)) * 1000) *- 1;
	line((int)(fx / 2),(int)(fy / 2),sx + (int)(fx / 2),sy + (int)(fy / 2));
}

// １グリッドごとの共分散計算
float[][] AveX = new float[8][8];
float[][] AveY = new float[8][8];
float[][] Cov  = new float[8][8];
void Covariance(byte field[][],int gx,int gy,int G)
{
	int N=0;
	AveX[gx][gy] = 0;
	AveY[gx][gy] = 0;
	Cov[gx][gy]  = 0;
	/*平均座標計算*/
	for(int i=gx*G;i<(gx+1)*G;i++)
	{
		for(int j=gy*G;j<(gy+1)*G;j++)
		{
			if(field[i][j]!=0)
			{
				AveX[gx][gy]+=i-gx*G;
				AveY[gx][gy]+=j-gy*G;
				N++;//データの個数
			}
		}
	}
	if(N!=0)
	{
		AveX[gx][gy]/=N;
		AveY[gx][gy]/=N;
		/*共分散計算*/
		for(int i=gx*G;i<(gx+1)*G;i++)
		{
			for(int j=gy*G;j<(gy+1)*G;j++)
			{
				if(fielddata[i][j]!=0)
				{
					float Xk=i-gx*G;
					float Yk=j-gy*G;
					Cov[gx][gy]+=(Xk-AveX[gx][gy])*(Yk-AveY[gx][gy]);
				}
			}
		}
		Cov[gx][gy]/=N-1;
	}
}
//NDT Slam

float[][] preCov  = new float[8][8];
void NDT(byte nowfield[][],byte prefield[][],boolean start)
{
	textSize(10);
	String data;
	for(int x=0;x<8;x++)
	{
		for(int y=0;y<8;y++)
		{
			Covariance(nowfield,x,y,grid);
			data="AveX:"+nf(x)+"/"+nf(AveX[x][y],2,3);
			text(data,x*grid,y*grid+10);
			data="AveY:"+nf(y)+"/"+nf(AveY[x][y],2,3);
			text(data,x*grid,y*grid+20);
			data="Cov :"+nf(Cov[x][y],2,3);
			text(data,x*grid,y*grid+30);
		}
	}
}

//System
boolean START=false;
int dis = 0,angle;
void draw()
{
	field();
	gaze();
	print();
	NDT(fielddata,fielddata_,START);

	print(dis);
	print(",");
	print(angle);
	print(" / ");
	print(START);
	println(" / ");

	delay(5);
}

void keyPressed()
{
	if (key == 'A' || key == 'a')
	{
		clean(fielddata);
		clean(fielddata_);
		background(0);
	}
}

void serialEvent(Serial p)
{
	int x = 0,y = 0;
	if (p.available() == 4)
	{
		byte[] inBuf = new byte[4];
		p.readBytes(inBuf);
		dis = (inBuf[0]<<8) + (inBuf[1] & 0xff);
		angle = (inBuf[2]<<8) + (inBuf[3] & 0xff);
		START=(359>angle&&angle<1)?true:false;
		x = (int)(cos(radians((float)angle)) * dis);
		y = (int)(sin(radians((float)angle)) * dis) *- 1;
		save(x,y,START);
	}
}
