#ifndef BOXER_H
#define BOXER_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlRecord>

    class BoxeR : public QObject
{
    Q_OBJECT
public:
    explicit BoxeR();
    virtual ~BoxeR();
    Q_INVOKABLE
        void nextRecord();
    Q_INVOKABLE
        void saveRecord(QString, QString, QString);
    Q_INVOKABLE
        int getNTasks();
    Q_INVOKABLE
        void dbconnect();

private:
    QSqlDatabase database;
    QSqlQuery query;
    QSqlRecord rec;
    QString dbName = "tasks";
    int ntasks = 0;

signals:
    void end(bool succed);
    void loadTask(QString task, QString endTask, QString progress);

private slots:
};

#endif // BOXER_H
