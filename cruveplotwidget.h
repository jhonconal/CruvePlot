#ifndef CRUVEPLOTWIDGET_H
#define CRUVEPLOTWIDGET_H

#include <QWidget>
#include <QPainter>
#include <QTimer>
#include "qcustomplot.h"

namespace Ui {
class CruvePlotWidget;
}

class CruvePlotWidget : public QWidget
{
    Q_OBJECT

public:
    explicit CruvePlotWidget(QWidget *parent = 0);
    ~CruvePlotWidget();
    //初始化绘图面板
    void CruveInit();


protected:


private slots:

    void xRealTimeDataSlot();
    void yRealTimeDataSlot();
    void zRealTimeDataSlot();

    void on_radioButton_2_clicked(bool checked);

    void on_radioButton_clicked(bool checked);

    void on_radioButton_3_clicked(bool checked);

    void on_SetButton_clicked();

private:
    Ui::CruvePlotWidget *ui;

    QTimer *updateTimer;
    float xData1,xTempData,xData2;
    float yData1,yTempData,yData2;
    float zData1,zTempData,zData2;
};

#endif // CRUVEPLOTWIDGET_H
