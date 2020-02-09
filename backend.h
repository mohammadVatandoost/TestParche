#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QTimer>
#include <QTime>
#include "serialport.h"

class BackEnd : public SerialPort
{
    Q_OBJECT
public:
    explicit BackEnd();
    QTimer *timer;

signals:

public slots:

private slots:
    void recieveSerialPort();
    void timerSlot();
};

#endif // BACKEND_H
