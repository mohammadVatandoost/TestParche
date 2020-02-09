#include "backend.h"

BackEnd::BackEnd()
{
    // timer for connection check
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(timerSlot()));
    timer->start(1000);
}

void BackEnd::recieveSerialPort()
{

}

void BackEnd::timerSlot()
{

}
