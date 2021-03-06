﻿#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QTimer>
#include <QTime>
#include "serialport.h"
#include "standardmodel.h"
#include "general.h"
#include "jsonstoring.h"

class BackEnd : public SerialPort
{
    Q_OBJECT
public:
    explicit BackEnd();
    QTimer *timer;
    StandardModel *sModel;
    void setStandardModel(StandardModel *standardModel);
    JsonStoring jsonString;
    GeneralData generalData;

    bool loadingFlag = false;
    bool connectState = false;
    Q_INVOKABLE bool getLoadingFlag();
    Q_INVOKABLE void setLoadingFlag(bool value);

    Q_INVOKABLE bool getFilterActivity(int index);
    Q_INVOKABLE void setFilterActivity(int index, bool value);
    Q_INVOKABLE QString getFilterLifeTime(int index);
    Q_INVOKABLE void saveTimeSetting(int hour, int minute);

    Q_INVOKABLE void setLightIntensity(int value);
    Q_INVOKABLE int getLightIntensity();

    Q_INVOKABLE void setRelay(int num, bool value);
    Q_INVOKABLE double getTemp();
    Q_INVOKABLE double getHumidity();
    Q_INVOKABLE double getLampTemp();
    Q_INVOKABLE double getSTDBlackTemp();
    Q_INVOKABLE int getAnalog1();
    Q_INVOKABLE int getAnalog2();
    Q_INVOKABLE int getInput1();
    Q_INVOKABLE int getInput2();
    Q_INVOKABLE double getRainOnP();
    Q_INVOKABLE double getRainOffP();
    Q_INVOKABLE double getTotalTimeP();
    Q_INVOKABLE double getRainOnTime();
    Q_INVOKABLE double getRainOffTime();
    Q_INVOKABLE double getTotalTime();


     void decodePacket(QString temp);
     int counterSendingFlag = 0 ;
     // algorithm run
     Q_INVOKABLE void algStart(int stIndex);
     Q_INVOKABLE void algPause();
     Q_INVOKABLE void algStop();
     Q_INVOKABLE int getAlgState();
     int counterAlgCommand = 0;
     int algState = Stoped;
     int algTimeCounter = 0;
     int rainOnTimeCount = 0;
     int rainOffTimeCount = 0;
     int rainOnSetPoint = 0;
     int rainOffSetPoint = 0;
     QTimer *timerAlg;
     Standard runingSt;
     bool lampTempRecovery = false;


signals:

public slots:

private slots:
    void recieveSerialPort();
    void timerSlot();
    void timerSlotAlg();
};

#endif // BACKEND_H
