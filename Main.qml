import QtQuick 2.4
import Ubuntu.Components 1.2

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "alarm.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
//    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("alarm")

        Alarm{
            id: alarm
        }

        Column {
            spacing: units.gu(1)

            Row {
                spacing: units.gu(1)

                Label {
                    id: date
                    text: "Date:"
                    anchors.verticalCenter: parent.verticalCenter
                }
                TextField {
                    text: alarm.date.toString()
                    onAccepted: {
                        console.log("this is cool!");
                        onAccepted: alarm.date = new Date(text)
                    }
                }
            }

            Row {
                spacing: units.gu(1)
                Label {
                    id: msg
                    text: "Message:"
                    anchors.verticalCenter: parent.verticalCenter
                }
                TextField {
                    text: alarm.message
                    onAccepted: {
                        console.log("Setting the alarm message!")
                        alarm.message = text
                    }
                }
            }

            Button {
                text: "Save"
                onClicked: {
                    var now = new Date();
                    var newdate = new Date(now.getTime() + 10*1000);
                    console.log("now: " + newdate.toLocaleDateString())
                    alarm.date = newdate;

                    alarm.save();
                    if (alarm.error !== Alarm.NoError) {
                        print("Error saving alarm, code: " + alarm.error);
                    } else {
                        print("There is no error!")
                    }

                }
            }
        }
    }
}

