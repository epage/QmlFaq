import QtQuick 1.0

Rectangle
{
	id: application
	width: 200
	height: 600

	ListModel
	{
		id: hardCodedList

		ListElement {name: "Bob"}
		ListElement {name: "Susan"}
		ListElement {name: "Alice"}
	}

	function generate(a)
	{
		return "Name"+a
	}

	property list<QtObject> programmaticModel: [
		QtObject { property string name: generate(1) }
	]

	ListView
	{
		//model: hardCodedList
		model: programmaticModel
		anchors.fill: parent
		delegate: Text
		{
			text: model.name
		}
	}
}


