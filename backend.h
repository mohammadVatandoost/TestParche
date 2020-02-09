#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include "serialport.h"

class BackEnd : public SerialPort
{
    Q_OBJECT
public:
    explicit BackEnd();

signals:

public slots:
};

#endif // BACKEND_H
