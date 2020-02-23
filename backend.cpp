#include "backend.h"

BackEnd::BackEnd()
{
    // timer for connection check
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(timerSlot()));
    timer->start(400);
    // timer for algorithm
    timerAlg = new QTimer(this);
    connect(timerAlg, SIGNAL(timeout()), this, SLOT(timerSlotAlg()));
    generalData = jsonString.getGeneralData();
}

void BackEnd::setStandardModel(StandardModel *standardModel)
{
    sModel = standardModel;
}

bool BackEnd::getLoadingFlag()
{
    return loadingFlag;
}

void BackEnd::setLoadingFlag(bool value)
{
    cout<< "setLoadingFlag:"<<value<<endl;
    loadingFlag = value;
}

bool BackEnd::getFilterActivity(int index)
{
    if(index>5) {
        return false;
    }
    return generalData.filtersActivity[index];
}

void BackEnd::setFilterActivity(int index, bool value)
{
    if(index>5) {
        return;
    }
    generalData.filtersActivity[index] = value;
}

QString BackEnd::getFilterLifeTime(int index)
{
    if(index>5) {
        return "00:00:00";
    }
    //ask ????????????????????????????/
    return "00:00:00";
}

void BackEnd::saveTimeSetting(int hour, int minute)
{
    generalData.testTimeHour = hour;
    generalData.testTimeMinute = minute;
    generalData.testTimeSecond = (hour*3600) + minute*60 ;
    jsonString.storeGeneralData(generalData);
}

void BackEnd::setLightIntensity(int value)
{
    generalData.lightIntensity = value; jsonString.storeGeneralData(generalData);
}

int BackEnd::getLightIntensity()
{
    return generalData.lightIntensity;
}

void BackEnd::setRelay(int num, bool value)
{
    QString command;
    if(value) {
       command = "R"+QString::number(num);
    } else {
       command = "r"+QString::number(num);
    }
    QByteArray bData;
    bData.append(command);
    serial->write(bData);
}

double BackEnd::getTemp()
{
    return generalData.temperature;
}

double BackEnd::getHumidity()
{
    return generalData.humidity;
}

double BackEnd::getLampTemp()
{
    return generalData.lampTemp;
}

double BackEnd::getSTDBlackTemp()
{
    return generalData.STDBlackTemp;
}

int BackEnd::getAnalog1()
{
    return generalData.analog1;
}

int BackEnd::getAnalog2()
{
    return generalData.analog2;
}

int BackEnd::getInput1()
{
    return generalData.input1;
}

int BackEnd::getInput2()
{
    return generalData.input2;
}

double BackEnd::getRainOnP()
{
    if(runingSt.rainOn == 0) {return 0;}
    return rainOnTimeCount/runingSt.rainOn;
}

double BackEnd::getRainOffP()
{
    if(runingSt.rainOff == 0) {return 0;}
    return rainOffTimeCount/runingSt.rainOff;
}

double BackEnd::getTotalTimeP()
{
    if(generalData.testTimeSecond == 0) {return 0;}
    return algTimeCounter/generalData.testTimeSecond;
}

double BackEnd::getRainOnTime()
{
    return rainOnSetPoint - rainOnTimeCount;
}

double BackEnd::getRainOffTime()
{
    return rainOffSetPoint - rainOffTimeCount;
}

double BackEnd::getTotalTime()
{
   return generalData.testTimeSecond - algTimeCounter;
}

void BackEnd::decodePacket(QString temp)
{
    if(temp.contains("T1:")) {
        temp = temp.replace("T1:","");
        generalData.temperature = temp.toFloat();
    } else if(temp.contains("T2:")) {
        temp = temp.replace("T2:","");
        generalData.STDBlackTemp = temp.toFloat();
    } else if(temp.contains("T3:")) {
        temp = temp.replace("T3:","");
        generalData.lampTemp = temp.toFloat();
    } else if(temp.contains("H1:")) {
        temp = temp.replace("H1:","");
        generalData.humidity = temp.toFloat();
    } else if(temp.contains("A0:")) {
        temp = temp.replace("A0:","");
        generalData.analog1 = temp.toFloat();
    } else if(temp.contains("A1:")) {
        temp = temp.replace("A1:","");
        generalData.analog2 = temp.toFloat();
    } else if(temp.contains("A2:")) {
        temp = temp.replace("A2:","");
        generalData.lightIntensity = temp.toInt();
    } else if(temp.contains("IN1:")) {
        temp = temp.replace("IN1:","");
        generalData.input1 = temp.toInt();
    } else if(temp.contains("IN2:")) {
        temp = temp.replace("IN2:","");
        generalData.input2 = temp.toInt();
    }
}

void BackEnd::algStop()
{
    QByteArray bData;
    bData.append(MotorOff);
    serial->write(bData);
    counterAlgCommand = 0;
    algState = Stoped;
    lampTempRecovery = true;
    timerAlg->start(100);
}

int BackEnd::getAlgState()
{
    return algState;
}

void BackEnd::algStart(int stIndex)
{
    runingSt = sModel->list()->items().at(stIndex);
    rainOnSetPoint = runingSt.rainOn*60;
    rainOffSetPoint = runingSt.rainOff*60;
    QByteArray bData;
    bData.append(MotorOn);
    serial->write(bData);
    counterAlgCommand = 0;
    timerAlg->start(100);
    if(algState == Stoped) {
        algTimeCounter = 0;
        rainOffTimeCount = 0;
        rainOnTimeCount = 0;
    }
    algState = Runing;
}

void BackEnd::algPause()
{
    QByteArray bData;
    bData.append(MotorOff);
    serial->write(bData);
    counterAlgCommand = 0;
    algState = Paused;
    lampTempRecovery = true;
    timerAlg->start(100);
}

void BackEnd::recieveSerialPort()
{

}

void BackEnd::timerSlot()
{
    if(!serial->isOpen()) {
        Q_FOREACH(QSerialPortInfo port, QSerialPortInfo::availablePorts()) {
                   serial->setPortName(port.portName());
                   qDebug() << " portName : " << port.portName();
                   if(serial->open(QIODevice::ReadWrite)) {
                     connectState = true;
                     qDebug() << " conndected : ";
//                     connect(serial, SIGNAL(readyRead()), this, SLOT(recieveSerialPort()));
                     break;
                   } else {
                       connectState = false;
                       qDebug() << "Not conndected : ";
                       serial->close();
                   }
        }
    } else {
        QByteArray bData = serial->readAll();
        QString dataString;dataString.append(bData);
        decodePacket(dataString);
        if(counterSendingFlag == 0) {
            serial->write("S1");counterSendingFlag++;
        } else if(counterSendingFlag == 1) {
            serial->write("S2");counterSendingFlag++;
        } else if(counterSendingFlag == 2) {
            serial->write("S3");counterSendingFlag++;
        } else if(counterSendingFlag == 3) {
            serial->write("S4");counterSendingFlag++;
        } else if(counterSendingFlag == 4) {
            serial->write("S5");counterSendingFlag++;
        } else if(counterSendingFlag == 5) {
            serial->write("S6");counterSendingFlag++;
        } else if(counterSendingFlag == 6) {
            serial->write("S7");counterSendingFlag++;
        } else if(counterSendingFlag == 7) {
            serial->write("S8");counterSendingFlag++;
        } else if(counterSendingFlag == 8) {
            serial->write("S9");
            counterSendingFlag = 0;
        }
        // alg running
        if(algState == Runing) {
            algTimeCounter++;
            if(rainOnTimeCount < runingSt.rainOn) {
                 rainOnTimeCount++; rainOffTimeCount = 0;
            } else if(rainOffTimeCount < runingSt.rainOff) {
                 rainOffTimeCount++;
                 if(rainOffTimeCount == runingSt.rainOff) {rainOnTimeCount = 0;}
            }
            if(algTimeCounter == generalData.testTimeSecond) {
                algStop();
            }
        }
        // alg recovery
        if(lampTempRecovery) {
            if(generalData.lampTemp<50) {
              lampTempRecovery = false;
              QByteArray bData;
              bData.append(MainFanOff);
              serial->write(bData);
            }
        }
    }
}

void BackEnd::timerSlotAlg()
{
   if(algState == Runing) {
       if(counterAlgCommand == 0) {
           QByteArray bData;
           bData.append(MainFanOn);
           serial->write(bData);
       } else if(counterAlgCommand == 1) {
           QByteArray bData;
           bData.append(XenonOn);
           serial->write(bData);
           timerAlg->stop();
       }
       counterAlgCommand++;
   } else if(algState == Stoped || algState == Paused) {
       if(counterAlgCommand == 0) {
           QByteArray bData;
           bData.append(CoolerOff);
           serial->write(bData);
       } else if(counterAlgCommand == 1) {
           QByteArray bData;
           bData.append(XenonOff);
           serial->write(bData);
       } else if(counterAlgCommand == 2) {
           QByteArray bData;
           bData.append(UlteraOff);
           serial->write(bData);
       } else if(counterAlgCommand == 3) {
           QByteArray bData;
           bData.append(SprayOff);
           serial->write(bData);
       } else if(counterAlgCommand == 4) {
           QByteArray bData;
           bData.append(SparkOff);
           serial->write(bData);
       } else if(counterAlgCommand == 5) {
           QByteArray bData;
           bData.append(RHFanOff);
           serial->write(bData);
           timerAlg->stop();
       }
       counterAlgCommand++;
   }

}
