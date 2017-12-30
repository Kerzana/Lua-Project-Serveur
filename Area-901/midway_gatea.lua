sleep(1)
gateA = peripheral.wrap("stargate_14")
gateB = peripheral.wrap("stargate_10")
adress = "NFQ2-080-HH"
 
function start()
    while true do
    state, engaged, direction = gateA.stargateState()
  if state == "Dialling" then
  remote = " "
  sleep(1)
  gateA.closeIris()
  print(gateA.remoteAddress())
  remote = gateA.remoteAddress()
  end
        if remote == "401LECD4M" then
   gateB.disconnect()
   sleep(0)
            gateB.dial(adress)
            gateB.closeIris()
        while true do
                state = gateA.stargateState()
                if state == "Connected" then
                    break
                end
                sleep(0)
            end
  sleep(10)
  if arg1 == "AZERTY" then
  gateA.openIris()
    sleep(10)
    print("Lololol")
  end
            gateA.disconnect()
        else
            gateA.disconnect()
        end
        sleep(1)
    end
end
 
function receiveMessage()
    while true do
  arg1 = " "
        event, arg0, arg1 = os.pullEvent("sgMessageReceived")
  if arg1 == "AZERTY" then
    sleep(15)
  else
    print(arg1)
  end
        sleep(0)
    end
end
 
parallel.waitForAll(start,receiveMessage)