#ifndef BACKEND_H
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

    Q_INVOKABLE bool getFilterActivity(int index);
    Q_INVOKABLE void setFilterActivity(int index, bool value);
    Q_INVOKABLE QString getFilterLifeTime(int index);
    Q_INVOKABLE void saveTimeSetting(int hour, int minute);
    Q_INVOKABLE void setLightIntensity(int value);
    Q_INVOKABLE int getLightIntensity();

signals:

public slots:

private slots:
    void recieveSerialPort();
    void timerSlot();
};

#endif // BACKEND_H
