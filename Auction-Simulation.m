format short
ctr = [0.9, 0.6, 0.3];
v = [0.6, 0.4, 0.2];
player1 = [0, 0, 0, 0, 0]; %Utility, ctr, value, bid, position
player2 = [0, 0, 0, 0, 0];
player3 = [0, 0, 0, 0, 0];
order = [0, 0, 0];
equilibria = []; %ctrs, values, bids, social welfare
bestsw = [0 0 0 0 0 0 0 0 0 0]; %social welfare, ctr1, ctr2, ctr3, val1, val2, val3, bid1, bid2, bid3
worsteq = [realmax 0 0 0 0 0 0 0 0 0];
count = 0;
for ctr1=0:0.1:1
    disp(ctr1)
    for ctr2=0:0.1:ctr1
        for ctr3=0:0.1:ctr2 %maintains order ctr1 >= ctr1 >= ctr3
            for valPerClick1=0:0.1:1
                for valPerClick2=0:0.1:valPerClick1 %maintains order v1 >= v2 >= v3
                    for valPerClick3=0:0.1:valPerClick2
                        for bid1=0:0.1:valPerClick1 %Keeps the bids below the players' respective values so they don't get negative utilities
                            for bid2=0:0.1:valPerClick2
                                for bid3=0:0.1:valPerClick3
                                    count = count + 1;
                                    if bid1>bid2 && bid1>bid3 %Calculating the order of the players
                                        player1(5) = 1;
                                        order(1)=1;
                                        if bid2>bid3
                                            player2(5) = 2;
                                            player3(5) = 3;
                                            order(2)=2;
                                            order(3)=3;
                                        else
                                            player3(5) = 2;
                                            player2(5) = 3;
                                            order(2)=3;
                                            order(3)=2;
                                        end
                                    elseif bid2>bid3 && bid2>bid1
                                        player2(5) = 1;
                                        order(1)=2;
                                        if bid1>bid3
                                            player1(5) = 2;
                                            player3(5) = 3;
                                            order(2)=1;
                                            order(3)=3;
                                        else
                                            player3(5) = 2;
                                            player1(5) = 3;
                                            order(2)=3;
                                            order(3)=1;
                                        end
                                    else
                                        player3(5) = 1;
                                        order(1) = 3;
                                        if bid1>bid2
                                            player1(5) = 2;
                                            player2(5) = 3;
                                            order(2)=1;
                                            order(3)=2;
                                        else
                                            player2(5) = 2;
                                            player1(5) = 3;
                                            order(2)=2;
                                            order(3)=3;
                                        end
                                    end
                                    
                                    i1 = find(order==1); %Calculating what each player is paying
                                    paying1 = 0;
                                    if order(3) == 1
                                        paying1 = 0;
                                    else
                                        if order(i1+1) == 2
                                            paying1 = bid2;
                                        else
                                            paying1 = bid3;
                                        end
                                    end
                                    
                                    i2 = find(order==2);
                                    paying2 = 0;
                                    if order(3) == 2
                                        paying2 = 0;
                                    else
                                        if order(i2+1) == 1
                                            paying2 = bid1;
                                        else
                                            paying2 = bid3;
                                        end
                                    end
                                    
                                    i3 = find(order==3);
                                    paying3=0;
                                    if order(3) == 3
                                        paying3 = 0;
                                    else
                                        if order(i3+1) == 1
                                            paying3 = bid1;
                                        else
                                            paying3 = bid2;
                                        end
                                    end
                                    
                                    paying = sort([paying1, paying2, paying3], 'descend'); %Sort what the payments are for each slot
                                  
                                    utility11 = ctr1*(valPerClick1-paying(1));
                                    utility12 = ctr2*(valPerClick1-paying(2));
                                    utility13 = ctr3*(valPerClick1-paying(3)); %Calculates Player 1's possible utilities in the current state in all 3 slots
                                    
                                    utilities1 = [[1, utility11];[2, utility12];[3,utility13]];
                                    utilities1 = sortrows(utilities1, -2);
                                    if utilities1(1,1) == order(1) %If the order of payments already corresponds to where he wants to be
                                       %Player 1 doesnt want to move
                                       happy1 = true;
                                    else
                                        happy1 = false;
                                    end
                                    
                                    utility21 = ctr1*(valPerClick2-paying(1));
                                    utility22 = ctr2*(valPerClick2-paying(2));
                                    utility23 = ctr3*(valPerClick2-paying(3)); %Calculates Player 1's possible utilities in the current state in all 3 slots
                                    
                                    utilities2 = [[1, utility21];[2, utility22];[3,utility23]];
                                    utilities2 = sortrows(utilities2, -2);
                                    if utilities2(1,1) == order(2) %If the order of payments already corresponds to where he wants to be
                                       %Player 2 doesnt want to move
                                       happy2 = true;
                                    else
                                       happy2 = false;
                                    end
                                    
                                    utility31 = ctr1*(valPerClick3-paying(1));
                                    utility32 = ctr2*(valPerClick3-paying(2));
                                    utility33 = ctr3*(valPerClick3-paying(3)); %Calculates Player 3's possible utilities in the current state in all 3 slots
                                    
                                    utilities3 = [[1, utility31];[2, utility32];[3,utility33]];
                                    utilities3 = sortrows(utilities3, -2);
                                    if utilities3(1,1) == order(3) %If the order of payments already corresponds to where he wants to be
                                       %Player 3 doesnt want to move
                                       happy3 = true;
                                    else
                                        happy3 = false;
                                    end
                                    
                                    if happy1 == true && happy2 == true && happy3 == true %If all 3 players are happy where they are, an equilibrium has been achieved
                                        if utilities1(1,1) ~= utilities2(1,1) && utilities1(1,1) ~= utilities3(1,1) && utilities2(1,1) ~= utilities3(1,1) %Checks that players' utilities aren't overlapping
                                            %Equilibrium achieved
                                            equilibria = [equilibria; [ctr1, ctr2, ctr3, valPerClick1, valPerClick2, valPerClick3, bid1, bid2, bid3]]; %Adds current state to the list of equilibria
                                            ctrs = [ctr1, ctr2, ctr3];
                                            equilibriumsw = valPerClick1*ctrs(utilities1(1,1))+valPerClick2*ctrs(utilities2(1,1))+valPerClick3*ctrs(utilities3(1,1)); %Calculates the social welfare of the current equilibrium state
                                            if worsteq(1) > equilibriumsw %If the current social welfare is worse (lower) than the social welfare of the worst equilibrium
                                                worsteq = [equilibriumsw, ctr1, ctr2, ctr3, valPerClick1, valPerClick2, valPerClick3, bid1, bid2, bid3]; %Save the current state as the worst equilibrium
                                            end
                                        end
                                    end
                                    ctrs = [ctr1, ctr2, ctr3];
                                    sw = valPerClick1*ctrs(utilities1(1,1))+valPerClick2*ctrs(utilities2(1,1))+valPerClick3*ctrs(utilities3(1,1));%Calculate current social welfare of the state (whether it's an equilibrium or not)
                                    if bestsw(1) <= sw %If the current social welfare is better (higher) than the best social welfare
                                        bestsw = [sw, ctr1, ctr2, ctr3, valPerClick1, valPerClick2, valPerClick3, bid1, bid2, bid3]; %Save the best social welfare state as the current state
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

disp(count)
disp(length(equilibria))
disp("Best social welfare:")
disp(bestsw)
disp("Worst equilibrium:")
disp(worsteq)
disp("Highest Price of Anarchy achieved:")
disp(worsteq(1)/bestsw(1))