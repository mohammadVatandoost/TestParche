#ifndef STANDARDSLIST_H
#define STANDARDSLIST_H

#include <QObject>
#include <QVector>
#include "standard.h"

class StandardsList
{
public:
    StandardsList();
    QVector<Standard> standardItems;
    QVector<Standard> items();
    void addChannelItem(Standard item);
    bool setChannelItem(int index, Standard standard);

signals:
   void preItemAppended();
   void postItemAppended();
   void setData(const QModelIndex &index, const QVariant &value, int role);

   void preItemRemoved(int index);
   void postItemRemoved();
   void notifyInfoDataChanged();
};

#endif // STANDARDSLIST_H
