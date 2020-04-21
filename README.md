# OpenCourse

[![Build Status](https://travis-ci.org/thoughtfruit/OpenCourse.svg?branch=master)](https://travis-ci.org/thoughtfruit/OpenCourse)
[![Maintainability](https://api.codeclimate.com/v1/badges/e070221ff88efa70aa9b/maintainability)](https://codeclimate.com/github/thoughtfruit/OpenCourse/maintainability)
[![Gitter chat](https://badges.gitter.im/thoughtfruity/general.png)](https://gitter.im/thoughtfruity/general "Gitter chat")

OpenCourse is a **free, open-source course platform application** based on [OpenCourseProtocol]().

## Navigation

- [Project homepage 🐘]()
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
