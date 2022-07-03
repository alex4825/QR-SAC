import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2
import QtQuick.LocalStorage 2.15


Window {
    id: window
    width: 600
    height: 900
    visible: true
    title: "QR-SAC"

    property string dbId: 'UserDatabase'
    property string dbVersion: '1.0'
    property string dbDescription: 'The database stores information about the user'
    property int dbSize: 100000
    property var db

    //    Constructor for creating a database
    Component.onCompleted: {
            db = LocalStorage.openDatabaseSync(dbId, dbVersion, dbDescription, dbSize);
            db.transaction(
                function(tx) {
                tx.executeSql("CREATE TABLE IF NOT EXISTS userTable(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                property TEXT,
                value TEXT
                )");
                //if (tx.executeSql('SELECT * FROM userTable').rows.length === 0)
                    //tx.executeSql("INSERT INTO userTable(id, property, value) VALUES (1, 'Name', 'Ivan')");
            })
    }

    function popPage() {
        stackView.pop();
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: pageLogin
    }

    PageLogin {
        id: pageLogin
        onAuthorizationClicked: {
            stackView.push(pageNewAccount);
        }
        onMigrationClicked: {
            stackView.push(pageMigration);
        }
        visible: true
    }

    PageNewAccount {
        id: pageNewAccount
        onCreateAccountClicked: {
            stackView.push(pageDataBase);
        }

        visible: false
    }
    
    PageMigration {
        id: pageMigration

        visible: false
    }

    PageDB {
        id: pageDataBase

        visible: false
    }

    ScannerPage {
        id: scannerPage

        visible: false
    }




}
