#include "backend.h"

BackEnd::BackEnd()
{
    // timer for connection check
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(timerSlot()));
    timer->start(1000);
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

void BackEnd::recieveSerialPort()
{

}

void BackEnd::timerSlot()
{

}
