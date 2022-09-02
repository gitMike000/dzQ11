#include "listmodel.h"

ListModel::ListModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("./tasks.db");
    db.open();

    this->updateModel();
}

// Метод для получения данных из модели
QVariant ListModel::data(const QModelIndex & index, int role) const {

    // Определяем номер колонки, адрес так сказать, по номеру роли
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);

    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

// Метод для получения имен ролей через хешированную таблицу.
QHash<int, QByteArray> ListModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdRole] = "num";
    roles[ftaskName] = "ftaskName";
    roles[ftaskEnd] = "ftaskEnd";
    roles[fDegree] = "fDegree";
    return roles;
}

// Метод обновления таблицы в модели представления данных
void ListModel::updateModel()
{
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT * FROM tasks",db);
}
