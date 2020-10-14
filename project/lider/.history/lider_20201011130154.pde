//VScode Ctrl+shift+bで実行
import processing.serial.*;
Serial myPort;

public static final int fx = 1000;
public static final int fy = 1000;

public static final int grid = 125;

int x = 0,y = 0;
int dis = 0,angle;
//float angle=0;

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
void save(int x_,int y_)
{
	int indexX = x_ + (int)(fx / 2);
	int indexY = y_ + (int)(fy / 2);
	if (indexX > fx)indexX = fx;
	if (indexY > fy)indexY = fy;
	if (indexX < 0)indexX = 0;
	if (indexY < 0)indexY = 0;
	fielddata[indexX][indexY] +=1;
}
float[][] Ave = new float[64][64];
void NDT()
{
	for(int x=0;x<64;x++)
	{
	}
	for(int y=0;y<64;y++)
	{
	}
}
int r = 100;
int g = 50;
int b = 255;
void print()
{
	strokeWeight(3);
	for (int i = 0;i < fx;i++)
	{
		for (int j = 0;j < fy;j++)
		{
			if (fielddata[i][j]!= 0)
			{
				r = 100 + fielddata[i][j] * fielddata[i][j];
				b = 255 - fielddata[i][j] * fielddata[i][j];
				if (b < 0)b = 0;
				if (r > 255)r = 255;
				stroke(r,g,b);
				point(i,j);
			}
		}
	}
}
void clean()
{
	for (int i = 0;i < fx;i++)
	{
		for (int j = 0;j < fy;j++)
		{
			fielddata[i][j] = 0;
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

void draw()
{
	field();
	gaze();
	print();

	print(dis);
	print(",");
	print(angle);
	print(" / ");
	println(" / ");
	delay(5);
}

void keyPressed()
{
	if (key == 'A' || key == 'a')
	{
		clean();
		background(0);
	}
}

void serialEvent(Serial p)
{
	if (p.available() == 4)
	{
		byte[] inBuf = new byte[4];
		p.readBytes(inBuf);
		dis = (inBuf[0]<<8) + (inBuf[1] & 0xff);
		angle = (inBuf[2]<<8) + (inBuf[3] & 0xff);
		x = (int)(cos(radians((float)angle)) * dis);
		y = (int)(sin(radians((float)angle)) * dis) *- 1;
		save(x,y);
	}
}
