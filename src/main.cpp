// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[]) {

  QGuiApplication app(argc, argv);

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

  engine.loadFromModule("MediaPlayerModule", "Main");

  if (engine.rootObjects().isEmpty()) {
    return -1;
  }

  return app.exec();
}
