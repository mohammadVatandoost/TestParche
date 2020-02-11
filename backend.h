#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QTimer>
#include <QTime>
#include "serialport.h"
#include "standardmodel.h"

class BackEnd : public SerialPort
{
    Q_OBJECT
public:
    explicit BackEnd();
    QTimer *timer;
    StandardModel *sModel;
    void setStandardModel(StandardModel *standardModel);
signals:

public slots:

private slots:
    void recieveSerialPort();
    void timerSlot();
};

#endif // BACKEND_H
