gateB = peripheral.wrap("stargate_10")
combo = "4286"
 
function perm(arg1)
    tableau = { [0] = { "*" } }
    for i = 1, arg1:len() do
        table.insert(tableau, i, string.char(string.byte(arg1, i)))
    end
    for j = 1, #tableau do
        if tableau[j] == "-" then
            permission = tableau[j + 2]
            if permission == "*" then
                permission = 9
            else
                permission = tonumber(permission)
            end
            mdp = string.sub(arg1, 0, arg1:len() - 3)
            return mdp
        end
    end
    return 0
end
 
function cmp(arg1)
    tableau = { [0] = { "*" } }
    for i = 1, arg1:len() do
        table.insert(tableau, i, string.char(string.byte(arg1, i)))
    end
    for j = 1, #tableau do
        if tableau[j] == "-" then
            compte = tostring(tableau[j + 1])
            return compte
        end
    end
    return 0
end
 
function start()
    while true do
        while true do
        arg1 = " "
        event = " "
            event, arg1, arg2, arg3 = os.pullEvent()
            if event == "mag_swipe" then
                mdp = perm(arg1)
                compte = cmp(arg1)
                if combo == mdp and compte == "*" or compte == "*" then
                    gateB.openIris()
                    gateB.sendMessage(mdp)
                    sleep(10)
                    gateB.disconnect()
                end
             end
             sleep(0)          
        end
        sleep(0)
    end
end
 
start()