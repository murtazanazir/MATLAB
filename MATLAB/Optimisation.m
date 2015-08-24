

%% command line execution 






ticker = ('MSFT''YHOO''AMZN''JPM''GOOGL''AAPL''BAC''FB''CSCO''MU''GE''FB');

for i= 1:12
    
    
 price.(ticker(i)) = fetch(C,ticker(i),'Adj close','jun 1 08', 'May 31 11', 'm');
 temp = price.(ticker(i));
 Closeprice(:,i) = temp(:,2);
    
    


end 
