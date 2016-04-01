#ifndef SERIALASSIANT_H
#define SERIALASSIANT_H

#include <QMainWindow>
#include <stdio.h>
#include "qextserialbase.h"
#include "posix_qextserialport.h"
namespace Ui {
class SerialAssiant;
}

class SerialAssiant : public QMainWindow
{
    Q_OBJECT

public:
    explicit SerialAssiant(QWidget *parent = 0);
    ~SerialAssiant();
    //初始化串口
    void SerialInit();

    void WidgetInit(bool check);

//    void OpenSerial();

    void ReadData();

private slots:

    void on_ApplyButton_clicked();//初始化串口

    void on_ClearButton_clicked();

    void on_SendButton_clicked();

private:
    Ui::SerialAssiant *ui;
    Posix_QextSerialPort * serial;
};

#endif // SERIALASSIANT_H
