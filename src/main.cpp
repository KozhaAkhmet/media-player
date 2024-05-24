// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QCommandLineParser>
#include <QDir>

int main(int argc, char* argv[]) {

  QGuiApplication app(argc, argv);
  QCommandLineParser parser;

  QQmlApplicationEngine engine;
  // const QUrl url(u"qrc:/MediaPlayer/Main.qml"_qs);
  // QObject::connect(
  //     &engine, &QQmlApplicationEngine::objectCreated, &app,
  //     [url](QObject* obj, const QUrl& objUrl) {
  //       if (!obj && url == objUrl) QCoreApplication::exit(-1);
  //     },
  //     Qt::QueuedConnection);

  engine.addImportPath(QCoreApplication::applicationDirPath() + "/qml");
  engine.addImportPath(":/");

  if (!parser.positionalArguments().isEmpty()) {
    QUrl source = QUrl::fromUserInput(parser.positionalArguments().at(0), QDir::currentPath());
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &engine, [source](QObject *object, const QUrl &) {
                       qDebug() << "setting source";
                       object->setProperty("source", source);
                     });
  }

  engine.loadFromModule("MediaPlayerModule", "Main");

  if (engine.rootObjects().isEmpty()) {
    return -1;
  }

  return app.exec();
}
