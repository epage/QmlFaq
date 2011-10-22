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

	ListModel
	{
		id: programmaticModel
	}

	Component.onCompleted:
	{
		programmaticModel.append({name: generate(1)})
		programmaticModel.append({name: generate(2)})
		programmaticModel.append({name: generate(3)})
		programmaticModel.append({name: generate(4)})
	}


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


