#include "jsonstoring.h"

JsonStoring::JsonStoring()
{

}

void JsonStoring::storeGeneralData(GeneralData generalData)
{
     QJsonObject qJsonObject;
//     qJsonObject.insert("STDBlackTemp", generalData.STDBlackTemp);qJsonObject.insert("analog1", generalData.analog1);
//     qJsonObject.insert("analog2", generalData.analog2);qJsonObject.insert("cooler", generalData.cooler);
//     qJsonObject.insert("humidity", generalData.humidity);qJsonObject.insert("input1", generalData.input1);
//     qJsonObject.insert("STDBlackTemp", generalData.STDBlackTemp);qJsonObject.insert("STDBlackTemp", generalData.STDBlackTemp);
     QJsonArray array1,array2;
     for(int i=0; i<6;i++) {
         array1.push_front(generalData.filtersActivity[i]);
         array2.push_front(QString::number(generalData.filtersLifeTime[i]));
     }
     qJsonObject.insert("filtersActivity", array1);
     qJsonObject.insert("filtersLifeTime", array2);
     QString data = jsonToString(qJsonObject);
     storeToFile(data, GeneralDataFile);
}

GeneralData JsonStoring::getGeneralData()
{
   QString jsonString = getFileString(GeneralDataFile);
   GeneralData temp;
   if(jsonString == "") {
       cout<< "JsonStoring::getGeneralData() does not exist"<<endl;
       return  temp;
   }
   QJsonDocument qJsonDocument = QJsonDocument::fromJson(jsonString.toUtf8());
   QJsonObject qJsonObject = qJsonDocument.object();
   QJsonArray jsonArray1 = qJsonObject["filtersActivity"].toArray();
   QJsonArray jsonArray2 = qJsonObject["filtersLifeTime"].toArray();
   for(int i=0; i<jsonArray1.size(); i++) {
       temp.filtersActivity[i] = jsonArray1.at(i).toBool();
       temp.filtersLifeTime[i] = jsonArray2.at(i).toString().toLong();
   }

   return temp;
}

QString JsonStoring::jsonToString(QJsonObject jsonObject)
{
    QJsonDocument doc(jsonObject);
    return  doc.toJson(QJsonDocument::Compact);
}

void JsonStoring::storeToFile(QString data, QString fileName)
{
    QFile file(fileName);
        if(file.open(QIODevice::ReadWrite | QIODevice::Truncate | QIODevice::Text) )
        {
            QTextStream textStream( &file );
            QStringList stringList;
            textStream << data;
            file.close();
        } else {
            cout<< " file " << fileName.data() << " could not open" << endl;
        }
}

QString JsonStoring::getFileString(QString fileName)
{
    QString temp = "";
    QFile file(fileName);
    if(!file.exists()) {
        return temp;
    }
    if( !file.open(QFile::ReadOnly | QFile::Text) ) {
        cout << fileName.data() << " File not exists "<<endl;
    } else {
        QTextStream in(&file);
        temp = in.readLine();
        file.close();
    }

    return temp;
}

void JsonStoring::storeStandardsList(StandardsList *stList)
{
    QVector<Standard> stVector = stList->items();
    QJsonArray array1;
    for(int i=0; i<stVector.size(); i++) {
        Standard tempSt = stVector[i];
        QJsonObject stJsonObject;
        stJsonObject.insert("humidity", tempSt.humidity);stJsonObject.insert("rainOff", tempSt.rainOff);
        stJsonObject.insert("rainOn", tempSt.rainOn);stJsonObject.insert("standardId", tempSt.standardId);
        stJsonObject.insert("standardName", QString::fromStdString(tempSt.standardName));stJsonObject.insert("temperature", tempSt.temperature);
        stJsonObject.insert("turningMode", tempSt.turningMode);stJsonObject.insert("weathering", tempSt.weathering);
        array1.push_front(stJsonObject);
    }
    QJsonObject qJsonObject;
    qJsonObject.insert("stList", array1);
    QString data = jsonToString(qJsonObject);
    storeToFile(data, StandardsListFile);
}

void JsonStoring::getStandardsList(StandardsList *stList)
{
    QString jsonString = getFileString(StandardsListFile);

    if(jsonString == "") {
        cout<< "JsonStoring::getStandardsList() does not exist"<<endl;
        return ;
    }
    QJsonDocument qJsonDocument = QJsonDocument::fromJson(jsonString.toUtf8());
    QJsonObject qJsonObject = qJsonDocument.object();
    QJsonArray jsonArray = qJsonObject["stList"].toArray();

    foreach (const QJsonValue & value, jsonArray) {
        QJsonObject obj = value.toObject();
        Standard tempSt;
        tempSt.humidity = obj.value("humidity").toInt();tempSt.rainOff = obj.value("rainOff").toInt();
        tempSt.rainOn = obj.value("rainOn").toInt();tempSt.standardId = obj.value("standardId").toInt();
        tempSt.standardName = obj.value("standardName").toString().toStdString();tempSt.temperature = obj.value("temperature").toInt();
        tempSt.turningMode = obj.value("turningMode").toBool();tempSt.weathering = obj.value("weathering").toBool();
        stList->addStandardItem(tempSt);
    }
}
