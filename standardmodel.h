#ifndef STANDARDMODEL_H
#define STANDARDMODEL_H

#include <QAbstractListModel>
#include "standard.h"

class StandardsList;

class StandardModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(StandardsList *list READ list WRITE setList )
public:
    explicit StandardModel(QObject *parent = nullptr);
//    virtual ~BrooksChannelModel() {}
    enum {
        standardId, standardName, temperature, turningMode, weathering, rainOn, rainOff
    };

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    virtual QHash<int, QByteArray> roleNames() const override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    StandardsList *list() const;
    void setList(StandardsList *list);
    void addElement(Standard item);
    Q_INVOKABLE void makeNewStandard(QString stName, double stTemp, bool stTurnMode, bool stWeathering, int stRainOn, int stRainOff);
private:
    StandardsList *mList;
};

#endif // STANDARDMODEL_H
