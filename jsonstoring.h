#ifndef JSONSTORING_H
#define JSONSTORING_H

#include <iostream>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include "general.h"
#include "standardslist.h"

#define GeneralDataFile "GenralData.txt"
#define StandardsListFile "StandardsList.txt"




using namespace std;

class JsonStoring
{
public:
    JsonStoring();
    void storeGeneralData(GeneralData generalData);
    GeneralData getGeneralData();
    QString jsonToString(QJsonObject jsonObject);
    void storeToFile(QString data, QString fileName);
    QString getFileString(QString fileName);
    void storeStandardsList(StandardsList *stList);
    void getStandardsList(StandardsList *stList);
};

#endif // JSONSTORING_H
