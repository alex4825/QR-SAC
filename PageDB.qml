import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2
import QtQuick.LocalStorage 2.15

Page {
    id: menuDB
    anchors.fill: window.contentItem
    property int margin: 10
    property alias nowListView: listView
    property var selectedCells: []

    header: AllPageHeader {
        title: "Database"
    }

    property var dbRows;
    Component.onCompleted: {
        //db = LocalStorage.openDatabaseSync(dbId, dbVersion, dbDescription, dbSize);
        db.transaction(
            function(tx) {
            dbRows = tx.executeSql('SELECT * FROM userTable');
            console.log("Lenght = " + dbRows.rows.length);

            for (var i = 0; i < dbRows.rows.length; i++) {
                console.log("id = " + dbRows.rows.item(i).id);
                listView.model.append({"dbProperty": dbRows.rows.item(i).property, "dbValue": dbRows.rows.item(i).value});
            }


        })

    }

    Rectangle {
        id: titleRow
        anchors.top: header.bottom
        width: parent.width
        height: 50
        Row {
            anchors.centerIn: parent
            Text {
                text: "Property"
            }
            Text {
                text: "Value"
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        anchors.top: titleRow.bottom
        width: parent.width
        height: parent.height - header.height - titleRow.height

        ListView {
            id: listView

            anchors.fill: parent
            spacing: margin
            ScrollBar.vertical: ScrollBar {}
            model: listModel

            delegate: DBrow {
                cell1Text: model.dbProperty
                cell2Text: model.dbValue
                onSelectCell: {
                    backgroundColor = "red"
                    selectedCells.push(index)
                }
                onNotSelectCell: {
                    backgroundColor = "white"
                    selectedCells.splice(selectedCells.indexOf(index))
                }
            }

        }

        ListModel {
            id: listModel
//            ListElement {
//                dbProperty: "1"
//                dbValue: "11"
//            }
//            ListElement {
//                dbProperty: "2"
//                dbValue: "22"
//            }
//            ListElement {
//                dbProperty: "3"
//                dbValue: "33"
//            }
//            ListElement {
//                dbProperty: "4"
//                dbValue: "44"
//            }
//            ListElement {
//                dbProperty: "5"
//                dbValue: "55"
//            }
//            ListElement {
//                dbProperty: "6"
//                dbValue: "66"
//            }
        }
    }

    footer: Rectangle {
        id: footer
        color: "#34C924"
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height/8

        Button {
            id: buttonAdd
            text: "Add new"
            font.pointSize: 20
            anchors.left: parent.left
            anchors.margins: margin
            background: Rectangle {
                implicitWidth: window.width/6
                implicitHeight: footer.height
                color: this.down ? color.darker(1.5) : "#34C924"
            }
            onClicked: {
                popupWindow.visible = true;
            }
        }
        Button {
            id: buttonScan
            text: "Scanning a QR-code"
            font.pointSize: 20
            anchors.centerIn: parent
            background: Rectangle {
                implicitWidth: window.width/6
                implicitHeight: footer.height
                color: this.down ? color.darker(1.5) : "#34C924"
            }
            onClicked: {
                //stackView.push(scannerPage)
            }
        }
        Button {
            id: buttonDelete
            text: "Delete"
            font.pointSize: 20
            anchors.right: parent.right
            anchors.margins: margin
            background: Rectangle {
                implicitWidth: window.width/6
                implicitHeight: footer.height
                color: this.down ? color.darker(1.5) : "#34C924"
            }
            onClicked: {
                db.transaction(
                    function(tx) {
                        //tx.executeSql("DELETE FROM userTable");
                        selectedCells.sort();
                        console.log(selectedCells);

                        let i = selectedCells.length - 1;
                        while (i >= 0) {
                            listModel.remove(selectedCells[i]);
                            tx.executeSql("DELETE FROM userTable WHERE id = " + selectedCells[i]);
                            i--;
                        }
                })
                selectedCells = [];

            }
        }

    }

    PopupWindow {
        id: popupWindow
        onAdded: {
            listModel.append({"dbProperty": addedProperty, "dbValue": addedValue});
            db.transaction(
                function(tx) {
                    console.log("addedProperty = " + addedProperty + " addedValue = " + addedValue );
                    tx.executeSql("INSERT INTO userTable(id, property, value) VALUES ("
                                  + listModel.count + ",\'" + addedProperty + "\',\'" + addedValue +"\')");
                })
        }
    }

    Keys.onBackPressed: {
        popPage();
    }
}
