#ifndef SERIALPORT_H
#define SERIALPORT_H

#include <QObject>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <iostream>

using namespace std;

class SerialPort : public QObject
{
    Q_OBJECT
public:
    explicit SerialPort(QObject *parent = nullptr);
    QSerialPort *serial;
    bool connectSerialPort();
    bool connectSerialPort(QString comePort);
    bool connectSerialPort(int i);
    void disconnectSerialPort();
signals:

public slots:
    virtual void recieveSerialPort() = 0;
};

#endif // SERIALPORT_H
