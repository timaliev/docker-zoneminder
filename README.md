# docker-zoneminder

Docker container for [latest zoneminder](https://launchpad.net/~iconnor/+archive/ubuntu/zoneminder-master)

"ZoneMinder the top Linux video camera security and surveillance solution. ZoneMinder is intended for use in single or multi-camera video security applications, including commercial or home CCTV, theft prevention and child, family member or home monitoring and other domestic care scenarios such as nanny cam installations. It supports capture, analysis, recording, and monitoring of video data coming from one or more video or network cameras attached to a Linux system. ZoneMinder also support web and semi-automatic control of Pan/Tilt/Zoom cameras using a variety of protocols. It is suitable for use as a DIY home video security system and for commercial or professional video security and surveillance. It can also be integrated into a home automation system via X.10 or other protocols. If you're looking for a low cost CCTV system or a more flexible alternative to cheap DVR systems then why not give ZoneMinder a try?"

## Description

This is a fork of [this repository](github.com:diegosc78/docker-zoneminder).

Primary intended for Aarm64 platform (Raspberry Pi/Orange Pi/etc.).

## Install

Run `docker compose up` in this directory to get mysql 8.0 container from DockerHub and latest Zoneminder container build (from https://launchpad.net/~iconnor/+archive/ubuntu/zoneminder-master).

Access Zoneminder at [localhost](http://localhost/zm).
