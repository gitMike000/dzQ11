#ifndef LISTMODEL_H
#define LISTMODEL_H

#include <QObject>
#include <QSqlQueryModel>
#include <QSqlDatabase>

class ListModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    enum Roles {
        IdRole = Qt::UserRole + 1,
        ftaskName,
        ftaskEnd,
        fDegree
    };

    explicit ListModel(QObject *parent = 0);

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QSqlDatabase db;

signals:

public slots:
    void updateModel();
};

#endif // LISTMODEL_H
