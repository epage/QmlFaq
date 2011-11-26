import QtQuick 1.0

import com.nokia.meego 1.0

Page
{
	id: page
	tools: viewToolbar
	property string message

	Column
	{
		Text
		{
			text: message
		}

		Button
		{
			text: "Url pushed with properties"
			onClicked: {
				pageStack.push(Qt.resolvedUrl("RecursivePageAnswer.qml"), {message: message+" and World"})
			}
		}

		Button
		{
			text: "Component pushed with properties"
			onClicked: {
				var component = Qt.createComponent("RecursivePageAnswer.qml");
				if (component.status == Component.Ready) {
					pageStack.push(component, {message: message+" and World"})
				}
			}
		}

		Button
		{
			text: "Component assigned properties and pushed"
			onClicked: {
				var component = Qt.createComponent("RecursivePageAnswer.qml");
				if (component.status == Component.Ready) {
					component.message = message+" and World"
					pageStack.push(component)
				}
			}
		}

		Button
		{
			text: "Object pushed with properties"
			onClicked: {
				var component = Qt.createComponent("RecursivePageAnswer.qml");
				if (component.status == Component.Ready) {
					var object = component.createObject(component)
					pageStack.push(object, {message: message+" and World"})
				}
			}
		}

		Button
		{
			text: "Object assigned properties and pushed"
			onClicked: {
				var component = Qt.createComponent("RecursivePageAnswer.qml");
				if (component.status == Component.Ready) {
					var object = component.createObject(component)
					object.message = message+" and World"
					pageStack.push(object)
				}
			}
		}
	}

	ToolBarLayout
	{
		id: viewToolbar

		ToolIcon
		{
			iconId: "toolbar-back"
			onClicked: { pageStack.pop(); }
		}
	}
}

