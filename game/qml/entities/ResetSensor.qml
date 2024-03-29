import Felgo 3.0
import QtQuick 2.0

EntityBase {
  id: resetSensor
  entityType: "resetSensor"

  signal contact
  property int playerx : 0

  Text {
    anchors.centerIn: parent
    text: "reset sensor"
    color: "white"
    font.pixelSize: 9
  }

  BoxCollider {
    anchors.fill: parent
    collisionTestingOnlyMode: true
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      // if the player hits the sensor, we emit a signal which will be used to reset the player
      if(otherEntity.entityType === "player") {
        // we could also directly modify the player position here, but the signal approach is a bit cleaner and helps separating the components
          playerx = otherEntity.x
          console.debug(playerx)
        resetSensor.contact()
//          console.debug(playerx)
//          psb.running = true

      }
    }
  }
}

