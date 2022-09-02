#include "boxer.h"

#include <QDebug>

BoxeR::BoxeR()
{
}

BoxeR::~BoxeR()
{
    database.close();
}

void BoxeR::nextRecord()
{
    qDebug() << "Next record";

    while (query.next())
    {
        QString task = query.value(rec.indexOf("taskName")).toString();
        QString endTask = query.value(rec.indexOf("taskEnd")).toString();
        QString progress = query.value(rec.indexOf("degree")).toString();
        qDebug() << task << " " << endTask << " " << progress;
        ++ntasks;

        emit loadTask(task, endTask, progress);
    }
}

void BoxeR::saveRecord(QString task, QString endTask, QString progress)
{
    ++ntasks;
    QString strF = "INSERT INTO " + dbName + "(num, taskName, taskEnd, degree)"
                  "VALUES ('%1', '%2', '%3', '%4');";
    QString str = strF.arg(ntasks).arg(task).arg(endTask).arg(progress);

    query = QSqlQuery(str,database);
    if (query.isValid())
    {
        qDebug() << "Unable to insert";
        --ntasks;
    }
}

int BoxeR::getNTasks()
{
    return ntasks;
}

void BoxeR::dbconnect()
{
    database = QSqlDatabase::addDatabase("QSQLITE");
    database.setDatabaseName("./" + dbName + ".db");
//    database.setUserName("");
//    database.setHostName("");
//    databese.setPassword("");
    if (!database.open())
    {
        qDebug() << "Cannot open database" << database.lastError();
        emit end(false);
        return;
    }
    QStringList tables = database.tables();
    bool dbNOTcreate = true;
    foreach (QString table, tables) {
        if (dbName == table)
        {
            dbNOTcreate = false;
            break;
        }
    }
    //QSqlQuery queryT;
    //query = queryT;

    if (dbNOTcreate)
    {
        qDebug() << "Create table";
        QString str = "CREATE TABLE " + dbName + "("
                      "num INTEGER PRIMARY KEY NOT NULL,"
                      "taskName VARCHAR(50),"
                      "taskEnd  VARCHAR(10),"
                      "degree   VARCHAR(2) );";
        //if (!query.exec(str))
        query = QSqlQuery(str,database);
        if (query.isValid())
        {
            qDebug() << "Unable create table";
            emit end(false);
            return;
        }
    }

    query = QSqlQuery(("SELECT * FROM " + dbName),database);
    //if (!query.exec("SELECT * FROM " + dbName))
    if (query.isValid())
    {
        qDebug() << "Unable to select";
        return;
    }

    rec = query.record();

    emit end(true);
}
