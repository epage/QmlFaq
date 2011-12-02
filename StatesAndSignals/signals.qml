import QtQuick 1.0
import com.nokia.meego 1.0

PageStackWindow
{
	id: stackWindow

	initialPage: Page
	{
		id: pageId
		property string signalBasedState: "black";

		Component.onCompleted: {
			pageId.signalBasedState = "gray"
		}

		Column
		{
			anchors.fill: parent
			spacing: 10

			Text
			{
				text: pageId.signalBasedState
				width: parent.width
			}

			Rectangle
			{
				height: 50
				color: pageId.signalBasedState
				width: parent.width
			}

			ButtonRow
			{
				width: parent.width
				exclusive: true

				Button
				{
					text: "To red"
					onClicked: {pageId.signalBasedState = "red"}
				}
				Button
				{
					text: "To blue"
					onClicked: {pageId.signalBasedState = "blue"}
				}
				Button
				{
					text: "To green"
					onClicked: {pageId.signalBasedState = "green"}
				}
				Button
				{
					text: "To yellow"
					onClicked: {pageId.signalBasedState = "yellow"}
				}
			}
		}
	}
}

