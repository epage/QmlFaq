#!/usr/bin/env python
# -*- coding: UTF8 -*-

from __future__ import with_statement

import os
import functools
import logging

from PySide import QtCore
from PySide import QtGui
from PySide import QtDeclarative


_moduleLogger = logging.getLogger(__name__)


def log_exception(logger):

	def log_exception_decorator(func):

		@functools.wraps(func)
		def wrapper(*args, **kwds):
			try:
				return func(*args, **kwds)
			except Exception as e:
				logger.exception("Internal Error: %s" % e)
				raise

		return wrapper

	return log_exception_decorator


_indentationLevel = [0]


def log_call(logger):

	def log_call_decorator(func):

		@functools.wraps(func)
		def wrapper(*args, **kwds):
			logger.debug("%s> %s" % (" " * _indentationLevel[0], func.__name__, ))
			_indentationLevel[0] += 1
			try:
				return func(*args, **kwds)
			finally:
				_indentationLevel[0] -= 1
				logger.debug("%s< %s" % (" " * _indentationLevel[0], func.__name__, ))

		return wrapper

	return log_call_decorator


class Controller(QtCore.QObject):

	modelChanged = QtCore.Signal()

	def __init__(self):
		QtCore.QObject.__init__(self)

		self._stack = []

	@QtCore.Slot(str)
	@log_exception(_moduleLogger)
	@log_call(_moduleLogger)
	def push(self, item):
		self._stack.append(item)
		self.modelChanged.emit()

	@QtCore.Slot()
	@log_exception(_moduleLogger)
	@log_call(_moduleLogger)
	def pop(self):
		try:
			self._stack.pop()
			self.modelChanged.emit()
		except IndexError:
			pass

	@log_exception(_moduleLogger)
	@log_call(_moduleLogger)
	def _get_model(self):
		try:
			return self._stack[-1]
		except IndexError:
			return ""

	model = QtCore.Property(QtCore.QObject, _get_model, notify=modelChanged)


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

