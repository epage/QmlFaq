#!/usr/bin/env python
# -*- coding: UTF8 -*-

from __future__ import with_statement

import os
import logging

from PySide import QtCore
from PySide import QtGui
from PySide import QtDeclarative


_moduleLogger = logging.getLogger(__name__)


class Controller(QtCore.QObject):

	settingsLoaded = QtCore.Signal()
	backendLoaded = QtCore.Signal()

	def __init__(self):
		QtCore.QObject.__init__(self)

	@QtCore.Slot()
	def load_settings(self):
		_moduleLogger.debug("Settings Loaded")
		self.settingsLoaded.emit()

	@QtCore.Slot()
	def load_backend(self):
		_moduleLogger.debug("Settings Loaded")
		self.backendLoaded.emit()


def run(args):

	logFormat = '(%(relativeCreated)5d) %(levelname)-5s %(threadName)s.%(name)s.%(funcName)s: %(message)s'
	logging.basicConfig(level=logging.DEBUG, format=logFormat)

	_moduleLogger.debug("%s", __file__)
	_moduleLogger.debug("OS: %s", os.uname()[0])
	_moduleLogger.debug("Kernel: %s (%s) for %s", *os.uname()[2:])
	_moduleLogger.debug("Hostname: %s", os.uname()[1])

	app = QtGui.QApplication(args)

	controller = Controller()

	view = QtDeclarative.QDeclarativeView()
	view.setResizeMode(QtDeclarative.QDeclarativeView.SizeRootObjectToView)
	view.setWindowTitle(__file__)

	engine = view.engine()

	context = view.rootContext()
	context.setContextProperty("controller", controller)

	topLevelQMLFile = __file__.replace(".py", ".qml")
	view.setSource(topLevelQMLFile)

	view.show()
	return app.exec_()


if __name__ == "__main__":
	import sys

	val = run(sys.argv)
	sys.exit(val)

