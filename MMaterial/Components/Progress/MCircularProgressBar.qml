import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

Item {
    id: _progressCircle

    property int size: Size.pixel48 * 2
    property int lineWidth: Size.pixel4
    property int progress: 0

    property var accent: Theme.primary
    property color primaryColor: accent.main
    property color secondaryColor: "transparent"
    property bool showLabel: false

    property int animationDuration: 80

    width: size
    height: size
    Layout.preferredHeight: size
    Layout.preferredWidth: size

    onProgressChanged: {
        canvas.degree = (progress/100) * 360;
    }

    Caption{
        visible: _progressCircle.showLabel
        anchors.centerIn: parent
        font.pixelSize: _progressCircle.height* 0.25
        verticalAlignment: Qt.AlignVCenter
        text: _progressCircle.progress + "%"
        color: Theme.text.primary
    }

    Canvas {
        id: canvas

        property real degree: 0

        anchors.fill: parent
        antialiasing: true

        onDegreeChanged: {
            requestPaint();
        }

        onPaint: {
            var ctx = getContext("2d");

            var x = _progressCircle.width/2;
            var y = _progressCircle.height/2;

            var radius = _progressCircle.size/2 - _progressCircle.lineWidth
            var startAngle = (Math.PI/180) * 270;
            var fullAngle = (Math.PI/180) * (270 + 360);
            var progressAngle = (Math.PI/180) * (270 + degree);

            ctx.reset()
            ctx.lineWidth = _progressCircle.lineWidth;

            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, fullAngle);
            ctx.strokeStyle = _progressCircle.secondaryColor;
            ctx.stroke();

            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, progressAngle);
            ctx.strokeStyle = _progressCircle.primaryColor;
            ctx.stroke();
        }

        Behavior on degree {
            NumberAnimation {
                duration: _progressCircle.animationDuration
            }
        }
    }
}
