#include "serialassiant.h"
#include "ui_serialassiant.h"
#include <QStringList>
#include <QDebug>
SerialAssiant::SerialAssiant(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::SerialAssiant)
{
    ui->setupUi(this);
    SerialInit();
    setWindowFlags(windowFlags()& ~Qt::WindowMaximizeButtonHint);
    setFixedSize(730, 380);
}

SerialAssiant::~SerialAssiant()
{
    delete ui;
}

void SerialAssiant::SerialInit()
{

    QStringList comList;//串口号
    QStringList baudList;//波特率
    QStringList parityList;//校验位
    QStringList dataBitsList;//数据位
    QStringList stopBitsList;//停止位
    comList<<"ttyUSB0"<<"ttyUSB1"<<"tty0"<<"tty1"<<"tty2"<<"tty3"
                <<"ttyS0"<<"ttyS1"<<"ttyS2"<<"ttyS3"<<"ttyS4"<<"ttyS5"<<"ttyS6"
                <<"ttyS7"<<"ttyS8"<<"ttyS9";
    ui->cboxPortName->addItems(comList);
    ui->cboxPortName->setCurrentIndex(0);

    baudList<<"50"<<"75"<<"100"<<"134"<<"150"<<"200"<<"300"
                 <<"600"<<"1200"<<"1800"<<"2400"<<"4800"<<"9600"
                 <<"14400"<<"19200"<<"38400"<<"56000"<<"57600"
                 <<"76800"<<"115200"<<"128000"<<"256000";
    ui->cboxBaudRate->addItems(baudList);
    ui->cboxBaudRate->setCurrentIndex(19);

    dataBitsList<<"5"<<"6"<<"7"<<"8";
    ui->cboxDataBit->addItems(dataBitsList);
    ui->cboxDataBit->setCurrentIndex(3);

    parityList<<"无"<<"奇"<<"偶";
    ui->cboxParity->addItems(parityList);
    ui->cboxParity->setCurrentIndex(0);

    stopBitsList<<"2";

    ui->cboxStopBit->addItems(stopBitsList);
    ui->cboxStopBit->setCurrentIndex(0);

    WidgetInit(false);
}

void SerialAssiant::WidgetInit(bool check)
{
    ui->cboxStopBit->setEnabled(!check);
    ui->cboxParity->setEnabled(!check);
    ui->cboxDataBit->setEnabled(!check);
    ui->cboxBaudRate->setEnabled(!check);
    ui->cboxPortName->setEnabled(!check);

    ui->radioButton->setChecked(!check);
    ui->radioButton_2->setEnabled(!check);
    ui->radioButton_3->setEnabled(!check);

    //ui->ApplyButton->setEnabled(!check);
    ui->ClearButton->setEnabled(check);
    ui->SendButton->setEnabled(check);
    ui->lineEdit->setEnabled(check);
}

void SerialAssiant::ReadData()
{
      QByteArray byte = serial->readAll();
}

void SerialAssiant::on_ApplyButton_clicked()
{
    if(ui->ApplyButton->text()=="打开串口")
    {
        QString PortName = ui->cboxPortName->currentText();
        serial = new Posix_QextSerialPort("/dev/"+PortName);
        if(serial->open(QIODevice::ReadWrite))
        {
            //清空缓冲区
            serial->flush();
            //设置波特率
            serial->setBaudRate((BaudRateType)ui->cboxBaudRate->currentText().toInt());
            //设置数据位
            serial->setDataBits((DataBitsType)ui->cboxDataBit->currentText().toInt());
            //设置校验位
            serial->setParity((ParityType)ui->cboxParity->currentIndex());
            //设置停止位
            serial->setStopBits((StopBitsType)ui->cboxStopBit->currentIndex());
            serial->setFlowControl(FLOW_OFF);
            serial->setTimeout(10);

            WidgetInit(true);
            ui->ApplyButton->setText("关闭串口");
            qDebug()<<"Open Status:"<<serial->isOpen();
        }
    }
    else {
        WidgetInit(false);
        ui->ApplyButton->setText("打开串口");
        serial->flush();
        serial->close();
        perror("serial");
        qDebug()<<"Serial Status:"<<serial->isOpen();
    }
}

void SerialAssiant::on_ClearButton_clicked()
{
    ui->textEdit->clear();
}

void SerialAssiant::on_SendButton_clicked()
{
    QString string = ui->lineEdit->text();
    if(string=="")
    {
        ui->lineEdit->setFocus();
        return;
    }
    if(!serial->isOpen())
    {
        return;
    }
    QByteArray bytes =string.toAscii();
    int size = bytes.size();
    if(ui->radioButton->isChecked())//字符发出
    {
        //
        serial->write(bytes);
    }
    else if (ui->radioButton_2->isChecked()) {//HEX进制发出
        //
        serial->write(bytes);
    }else {//DEC进制发出
        //
        serial->write(bytes);
    }
    ui->textEdit->append(QString("发送:%1").arg(string));
}
