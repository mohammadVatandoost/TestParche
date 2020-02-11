#include "standardmodel.h"
#include "standardslist.h"

StandardModel::StandardModel(QObject *parent)
    : QAbstractListModel(parent)
    , mList(nullptr)
{
   mList = new StandardsList();
   jsonStoring.getStandardsList(mList);
//   Standard st;
//   addElement(st);
//   st.standardName = "sadfsadfasdf"; st.humidity = 42; st.turningMode = true; st.weathering = true; st.rainOff = 34;
//   st.rainOn = 42; st.temperature = 27;
//   addElement(st);
}

int StandardModel::rowCount(const QModelIndex &parent) const
{

    if (parent.isValid() || !mList)
        return 0;

    return mList->items().size();
}

QVariant StandardModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();


    const Standard item = mList->items().at(index.row());
    switch (role) {
     case standardName:
        return QVariant( QString::fromStdString(item.standardName));
     case standardId:
        return QVariant(item.standardId);
    case humidity:
       return QVariant( item.humidity);
    case rainOff:
       return QVariant(item.rainOff);
    case rainOn:
       return QVariant(item.rainOn);
    case temperature:
       return QVariant(item.temperature);
    case weathering:
       return QVariant(item.weathering);
    case turningMode:
       return QVariant(item.turningMode);
    }

    return QVariant();
}

bool StandardModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!mList)
        return false;

    if(index.row() >= mList->items().size()) {
        cout<< "setData index.row():"<< index.row()<<", role:"<< role << endl;
        return false;
    }
    Standard item = mList->items().at(index.row());
    switch (role) {
     case standardName:
        cout<<index.row()<<" setData standardName role "<<value.toString().toStdString()<<endl;
        item.standardName = value.toString().toStdString();
        break;
     case rainOff:
        cout<<index.row()<<" setData rainOff role "<<value.toInt()<<endl;
       item.rainOff = value.toInt();
       break;
     case rainOn:
        cout<<index.row()<<" setData rainOn role "<<value.toInt()<<endl;
       item.rainOn = value.toInt();
       break;
     case temperature:
        cout<<index.row()<<" setData temperature role :"<<value.toFloat()<<endl;
       item.temperature = value.toFloat();
       break;
    case standardId:
       cout<<index.row()<<" setData standardId role :"<<value.toInt()<<endl;
      item.standardId = value.toInt();
      break;
    case humidity:
       cout<<index.row()<<" setData humidity role :"<<value.toInt()<<endl;
      item.humidity = value.toInt();
      break;
    case turningMode:
       cout<<index.row()<<" setData turningMode role :"<<value.toBool()<<endl;
      item.turningMode = value.toBool();
      break;
    case weathering:
       cout<<index.row()<<" setData weathering role :"<<value.toBool()<<endl;
      item.weathering = value.toBool();
      break;
    default:
        break;
    }

    if(mList->setStandardItem(index.row(), item)) {
//        cout<< "emit data changed:"<< index.row()<< ", role:"<<role<<endl;
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }

    return false;
}

QHash<int, QByteArray> StandardModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[standardName] = "standardName";
    names[rainOff] = "rainOff" ;
    names[rainOn] = "rainOn" ;
    names[temperature] = "temperature" ;
    names[standardId] = "standardId" ;
    names[turningMode] = "turningMode" ;
    names[weathering] = "weathering" ;
    names[humidity] = "humidity" ;
    return names;
}

Qt::ItemFlags StandardModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

StandardsList *StandardModel::list() const
{
    return mList;
}

void StandardModel::setList(StandardsList *list)
{
    beginResetModel();
    if(mList)
        mList->disconnect(this);

    mList = list;

    endResetModel();
}

void StandardModel::addElement(Standard item)
{
    beginResetModel();
    mList->standardItems.append(item);
    endResetModel();
    jsonStoring.storeStandardsList(mList);
}

void StandardModel::makeNewStandard(QString stName, double stTemp, int stHumidity, bool stTurnMode, bool stWeathering, int stRainOn, int stRainOff)
{
    Standard st;
    st.standardName = stName.toStdString();
    st.temperature = stTemp;
    st.turningMode = stTurnMode;
    st.weathering = stWeathering;
    st.rainOff = stRainOff;
    st.rainOn = stRainOn;
    st.humidity = stHumidity;
    addElement(st);
}

void StandardModel::removeStandard(int index)
{
    beginResetModel();
    mList->standardItems.remove(index-1);
    endResetModel();
    jsonStoring.storeStandardsList(mList);
}

void StandardModel::setStandard(int index, QString stName, double stTemp, int stHumidity, bool stTurnMode, bool stWeathering, int stRainOn, int stRainOff)
{
    beginResetModel();
    mList->standardItems[index-1].standardName = stName.toStdString();
    mList->standardItems[index-1].temperature = stTemp;
    mList->standardItems[index-1].turningMode = stTurnMode;
    mList->standardItems[index-1].weathering = stWeathering;
    mList->standardItems[index-1].rainOff = stRainOff;
    mList->standardItems[index-1].rainOn = stRainOn;
    mList->standardItems[index-1].humidity = stHumidity;
    endResetModel();
    jsonStoring.storeStandardsList(mList);
}
