#include "cruveplotwidget.h"
#include "ui_cruveplotwidget.h"
#include <QDebug>
#include <QVector>
#include <QDesktopWidget>
#include "serialassiant.h"
CruvePlotWidget::CruvePlotWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::CruvePlotWidget)
{
    ui->setupUi(this);

    ui->radioButton->setChecked(true);
    CruveInit();
    int width = QApplication::desktop()->width();
    int height = QApplication::desktop()->height();
    qDebug()<<"width="<<width;
    qDebug()<<"height="<<height;

    updateTimer=new QTimer(this);
    updateTimer->start(5*1000);

    if(ui->radioButton->isChecked())
    {
        disconnect(updateTimer,SIGNAL(timeout()),this,SLOT(yRealTimeDataSlot()));
        disconnect(updateTimer,SIGNAL(timeout()),this,SLOT(zRealTimeDataSlot()));
        connect(updateTimer, SIGNAL(timeout()), this, SLOT(xRealTimeDataSlot()));
        updateTimer->start(0); // Interval 0 means to refresh as fast as possible
    }
// this->resize(width,height-38);
// setWindowFlags(Qt::WindowMinimizeButtonHint);
}

CruvePlotWidget::~CruvePlotWidget()
{
    delete ui;
}

void CruvePlotWidget::CruveInit()
{
    ui->qCustomPlot->legend->setVisible(true);
    ui->qCustomPlot->addGraph();
    QPen pen;
    pen.setWidth(2);
    pen.setColor(QColor(255, 0, 127));
    ui->qCustomPlot->graph(0)->setName("x轴曲线");
    ui->qCustomPlot->graph(0)->setPen(pen);
    //
     ui->qCustomPlot->addGraph();
    ui->qCustomPlot->legend->removeItem(ui->qCustomPlot->legend->itemCount()-1); // don't show two confidence band graphs in legend
    ui->qCustomPlot->graph(1)->setPen(pen);
    ui->qCustomPlot->graph(0)->setChannelFillGraph(ui->qCustomPlot->graph(1));
    //添加y轴曲线
    ui->qCustomPlot->addGraph();
    pen.setWidth(3);
    pen.setColor(QColor(85, 170, 0));
    ui->qCustomPlot->graph(2)->setPen(pen);
    ui->qCustomPlot->graph(2)->setName("y轴曲线");
    //添加z轴曲线
    ui->qCustomPlot->addGraph();
    pen.setWidth(4);
    pen.setColor(QColor(255, 170, 0));
    ui->qCustomPlot->graph(3)->setPen(pen);
    ui->qCustomPlot->graph(3)->setName("z轴曲线");

    //ui->qCustomPlot->xAxis->setRange(0,25,Qt::AlignLeft);
    //ui->qCustomPlot->xAxis->setLabel("x0");

    ui->qCustomPlot->yAxis->setRange((double)-20,(double)20);
    //ui->qCustomPlot->yAxis->setLabel("y0");
}

void CruvePlotWidget::xRealTimeDataSlot()
{
    QPen pen;
    pen.setWidth(2);
    pen.setColor(QColor(255, 0, 127));
    ui->qCustomPlot->graph(0)->setPen(pen);
    //ui->qCustomPlot->graph(0)->setBrush(QBrush(QColor(240, 255, 200)));
    ui->qCustomPlot->graph(0)->setAntialiasedFill(false);
    ui->qCustomPlot->xAxis->setTickLabelType(QCPAxis::ltDateTime);
    ui->qCustomPlot->xAxis->setDateTimeFormat("hh:mm:ss");
    ui->qCustomPlot->xAxis->setAutoTickStep(false);
    ui->qCustomPlot->xAxis->setTickStep(1);
    ui->qCustomPlot->axisRect()->setupFullAxesBox();

    double key = QDateTime::currentDateTime().toMSecsSinceEpoch()/1000.0;

    static double lastPointKey = 0;
    if (key-lastPointKey > 0.01) // at most add point every 10 ms
    {
      QTime time;
      time= QTime::currentTime();
      qsrand(time.msec()+time.second()*1000);
      int xxx=qrand()%20;
      ui->qCustomPlot->graph(0)->addData(key, xxx);
      ui->qCustomPlot->graph(0)->removeDataBefore(key-8);
      // rescale value (vertical) axis to fit the current data:
      ui->qCustomPlot->graph(0)->rescaleValueAxis();
      lastPointKey = key;
    }
    // make key axis range scroll with the data (at a constant range size of 8):
    ui->qCustomPlot->xAxis->setRange(key+0.25, 8, Qt::AlignRight);
    ui->qCustomPlot->replot();
}

void CruvePlotWidget::yRealTimeDataSlot()
{
    QPen pen;
    pen.setWidth(3);
    pen.setColor(QColor(85, 170, 0));
    ui->qCustomPlot->graph(2)->setPen(pen);
    //ui->qCustomPlot->graph(2)->setBrush(QBrush(QColor(240, 255, 200)));
    ui->qCustomPlot->graph(2)->setAntialiasedFill(false);
    ui->qCustomPlot->xAxis->setTickLabelType(QCPAxis::ltDateTime);
    ui->qCustomPlot->xAxis->setDateTimeFormat("hh:mm:ss");
    ui->qCustomPlot->xAxis->setAutoTickStep(false);
    ui->qCustomPlot->xAxis->setTickStep(1);
    ui->qCustomPlot->axisRect()->setupFullAxesBox();

    double key = QDateTime::currentDateTime().toMSecsSinceEpoch()/1000.0;

    static double lastPointKey = 0;
    if (key-lastPointKey > 0.01) // at most add point every 10 ms
    {
      QTime time;
      time= QTime::currentTime();
      qsrand(time.msec()+time.second()*1000);
      int yyy=qrand()%20;
      ui->qCustomPlot->graph(2)->addData(key, yyy);
      ui->qCustomPlot->graph(2)->removeDataBefore(key-8);
      // rescale value (vertical) axis to fit the current data:
      ui->qCustomPlot->graph(2)->rescaleValueAxis();
      lastPointKey = key;
    }
    // make key axis range scroll with the data (at a constant range size of 8):
    ui->qCustomPlot->xAxis->setRange(key+0.25, 8, Qt::AlignRight);
    ui->qCustomPlot->replot();
}

void CruvePlotWidget::zRealTimeDataSlot()
{
    QPen pen;
    pen.setWidth(4);
    pen.setColor(QColor(255, 170, 0));
    ui->qCustomPlot->graph(3)->setPen(pen);
    //ui->qCustomPlot->graph(3)->setBrush(QBrush(QColor(240, 255, 200)));
    ui->qCustomPlot->graph(3)->setAntialiasedFill(false);
    ui->qCustomPlot->xAxis->setTickLabelType(QCPAxis::ltDateTime);
    ui->qCustomPlot->xAxis->setDateTimeFormat("hh:mm:ss");
    ui->qCustomPlot->xAxis->setAutoTickStep(false);
    ui->qCustomPlot->xAxis->setTickStep(1);
    ui->qCustomPlot->axisRect()->setupFullAxesBox();

    double key = QDateTime::currentDateTime().toMSecsSinceEpoch()/1000.0;

    static double lastPointKey = 0;
    if (key-lastPointKey > 0.01) // at most add point every 10 ms
    {
      QTime time;
      time= QTime::currentTime();
      qsrand(time.msec()+time.second()*1000);
      int zzz=qrand()%20;
      ui->qCustomPlot->graph(3)->addData(key, zzz);
      ui->qCustomPlot->graph(3)->removeDataBefore(key-8);
      // rescale value (vertical) axis to fit the current data:
      ui->qCustomPlot->graph(3)->rescaleValueAxis();
      lastPointKey = key;
    }
    // make key axis range scroll with the data (at a constant range size of 8):
    ui->qCustomPlot->xAxis->setRange(key+0.25, 8, Qt::AlignRight);
    ui->qCustomPlot->replot();
}

void CruvePlotWidget::on_radioButton_clicked(bool checked)
{
    qDebug()<<"ui->radioButton="<<ui->radioButton->isChecked();
    ui->qCustomPlot->graph(2)->clearData();
    ui->qCustomPlot->graph(3)->clearData();
    if(checked == true)
    {
        disconnect(updateTimer,SIGNAL(timeout()),this,SLOT(yRealTimeDataSlot()));
        disconnect(updateTimer,SIGNAL(timeout()),this,SLOT(zRealTimeDataSlot()));
        connect(updateTimer, SIGNAL(timeout()), this, SLOT(xRealTimeDataSlot()));
        updateTimer->start(0); // Interval 0 means to refresh as fast as possible
    }
}

void CruvePlotWidget::on_radioButton_2_clicked(bool checked)
{
    qDebug()<<"ui->radioButton_2="<<ui->radioButton_2->isChecked();
     ui->qCustomPlot->graph(0)->clearData();
     ui->qCustomPlot->graph(3)->clearData();
    if(checked == true)
    {
        disconnect(updateTimer,SIGNAL(timeout()),this,SLOT(xRealTimeDataSlot()));
        disconnect(updateTimer,SIGNAL(timeout()),this,SLOT(zRealTimeDataSlot()));
        connect(updateTimer, SIGNAL(timeout()), this, SLOT(yRealTimeDataSlot()));
        updateTimer->start(0); // Interval 0 means to refresh as fast as possible
    }
}

void CruvePlotWidget::on_radioButton_3_clicked(bool checked)
{
    qDebug()<<"ui->radioButton_3="<<ui->radioButton_3->isChecked();
    ui->qCustomPlot->graph(0)->clearData();
    ui->qCustomPlot->graph(2)->clearData();
    if(checked == true)
    {
        disconnect(updateTimer,SIGNAL(timeout()),this,SLOT(xRealTimeDataSlot()));
        disconnect(updateTimer,SIGNAL(timeout()),this,SLOT(yRealTimeDataSlot()));
        connect(updateTimer, SIGNAL(timeout()), this, SLOT(zRealTimeDataSlot()));
        updateTimer->start(0); // Interval 0 means to refresh as fast as possible
    }
}

void CruvePlotWidget::on_SetButton_clicked()
{
    SerialAssiant *serialAssiant= new SerialAssiant(this);
    serialAssiant->show();
}
