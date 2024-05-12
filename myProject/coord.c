#include<stdio.h>
#include<conio.h>
#include<graphics.h>
void main() {
    int gd,gm,x1,y1,x2,dx,dy,steps;
    float xi,yi,x,y;
    int x0,y0,xmax,ymax;
    clrscr();
    detectgraph(&gd,&gm);
    initgraph(&gd,&gm,"c:\\tc\\bgi");
    xmax=getmaxx();
    ymax=getmaxx();
    x0=xmax/2;
    y0=xmax/2;
    line(x0,0,x0,xmax);
    line(0,y0,xmax,y0);
    circle(125,100,50);
    outtextxy(90,180,"circle");
    rectangle(400,150,550,50);
    outtextxy(450,180,"rectangle");
    arc(100,320,200,340,50);
    outtextxy(70,390,"arc");
    ellipse(450,350,0,360,100,50);
    outtextxy(450,430,"ellipse");
    getch();
    closegraph();
}