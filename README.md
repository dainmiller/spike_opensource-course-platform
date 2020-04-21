# OpenCourse

[![Build Status](https://travis-ci.org/thoughtfruit/OpenCourse.svg?branch=master)](https://travis-ci.org/thoughtfruit/OpenCourse)
[![Maintainability](https://api.codeclimate.com/v1/badges/d364e87c4a6e974dac96/maintainability)](https://codeclimate.com/github/thoughtfruit/OpenCourse/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/d364e87c4a6e974dac96/test_coverage)](https://codeclimate.com/github/thoughtfruit/OpenCourse/test_coverage)

OpenCourse is a **free, open-source course platform application** based on [OpenProtocol]().

Click below to **learn more** in a video:

![Screenshot](https://blog.joinmastodon.org/2018/06/why-activitypub-is-the-future/ezgif-2-60f1b00403.gif)

## Navigation

- [Project homepage 🐘]()
- [Support the development via Patreon][patreon]
- [View sponsors]()
- [Blog]()
- [Documentation]()

[patreon]: http://patreon.com/

## Deployment

**Tech stack:**

- **Ruby on Rails** powers the REST API and other web pages
- **React.js** and Redux are used for the dynamic parts of the interface

**Requirements:**

- **PostgreSQL** 9.5+
- **Redis** 4+
- **Ruby** 2.5+

The repository includes deployment configurations for **Docker and docker-compose**, but also a few specific platforms like **Heroku**, **Scalingo**, and **Nanobox**. The [**stand-alone** installation guide](https://docs.org/admin/install/) is available in the documentation.

A **Vagrant** configuration is included for development purposes.

## Contributing

You can open issues for bugs you've found or features you think are missing. You can also submit pull requests to this repository, or submit translations using Crowdin. To get started, take a look at [CONTRIBUTING.md](CONTRIBUTING.md).
