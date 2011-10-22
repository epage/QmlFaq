import QtQuick 1.0

Rectangle
{
	id: application
	width: 100
	height: 100

	Connections
	{
		target: controller.session
		onLoggedIn: {
			console.log("Success")
		}
	}

	Text
	{
		text: "Hello World"
		anchors.fill: parent

		MouseArea
		{
			anchors.fill: parent
			onClicked: {
				controller.send_signal()
			}
		}
	}
}


