// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ChallengeSubscriptionController from "./challenge_subscription_controller"
application.register("challenge-subscription", ChallengeSubscriptionController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)

import QrcodeController from "./qrcode_controller"
application.register("qrcode", QrcodeController)

import SwipeController from "./swipe_controller"
application.register("swipe", SwipeController)

import ToggleElementController from "./toggle_element_controller"
application.register("toggle-element", ToggleElementController)
