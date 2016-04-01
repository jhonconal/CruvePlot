#include "cruveplotwidget.h"
#include <QApplication>
#include <QTextCodec>
#include <stdio.h>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
#ifdef Q_OS_LINUX
    system("export   QT_QWS_FONTDIR=/lib");
    QTextCodec::setCodecForLocale(QTextCodec::codecForName("UTF-8"));
    QTextCodec::setCodecForTr(QTextCodec::codecForName("UTF-8"));       //支持Tr中文
    QTextCodec::setCodecForCStrings(QTextCodec::codecForName("UTF-8"));//支持中文文件名显示
    QFont font;
    font.setFamily(("kaiti.TTF"));
    font.setBold(false);
    a.setFont(font);

#endif
    CruvePlotWidget w;
    w.show();
    return a.exec();
}
