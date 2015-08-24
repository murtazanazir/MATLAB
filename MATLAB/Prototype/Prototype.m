tic


nAssets    =  nume1(DatasetRet);
Aineq      =  -DatasetRet';
r          = 0.0000001:0.000001:0.1;
Aeq        = ones(1,nAssets);
Beq        = 1;
lb         = zeros(nAssets,1);
ub         = ones (nAssets,1);
c          = Zeros(nAssets,1);
options    = optimset('Algorithm', 'interior-point-convex'); 
options    = optimset(options,'Display','iter','TolFun',le-10);
x0         = [1 0 0 0 0 0 0 0 0]'; 


for i     = 1:1: 100000,
    
    [x, fval,converge] = quadprog(p1Cov,c,Aineq,-r(i),Aeq,Beq,lb,ub,x0,options);
    
    if(converge ==1)
        
     pMean       =x'*DatasetRet;
     pVar        =sqrt(x'*DatasetCov*x);
     
     
     pMeanAnn   = {((1+pMean)^250)-1};
     pVarAnn    = {pvar*sqrt(250)};
     pSharpe    = pMeanAnn/pVarAnn; 
     
     
     
     Output{1,i} = pMean
     Output{2,i} = pMeanAnn;
     Output{3,i} = pVAr;
     Output{4,i} = pVarAnn;
     Output{5,i} = psharpe;
     Output{7,i} = x(1,1);
     Output{8,i} = x(2,1);
     Output{9,i} = x(3,1);
     Output{10,i} = x(4,1);
     Output{11,i} = x(5,1);
     Output{12,i} = x(6,1);
     Output{13,i} = x(7,1);
     Output{14,i} = x(8,1);
     Output{15,i} = x(9,1);
     
     pMean         = 0;
     PVar          = 0;
     pMeanAnn      = 0;
     pVarAnn       = 0;
     pharpe       = 0;
     
     
     continue;
     
    else
        
        break;
        
    end
    
end


maxsharpe = max {output(5,:)};
[row, col] = find {maxSharpe== output};
optiDailyRet = Output (1,col);
optidailyVar = Output(3,col);
optiyearlyRet = Output(2,col);
optiyearlyVar = Output (4,col); 


OptiAllocation = [ optiDailyRet
                  optiDailyVar
                  optiYearlyRet
                  optiyearlyVar
                  maxpSharpe
                  Output{7,col}
                  Output{8,col}
                  Output{9,col}
                  Output{10,col}
                  Output{11,col}
                  Output{12,col}
                  Output{13,col}
                  Output{14,col}
                  Output{15,Col}
                  
                  ];
              
       
              
              
 hold
 plot(output(4,:),  Output(2,:))
 title('Effecient Frontier');
 xlabel('portfolio Risk')
 ylabel('portfolio Return');
 plot(optiAllocation(4,1),optiAllocation(3,1),'O');
 print('dpng','-r300' ,'Effecenit Frontier');
 plot(DatasetStdAnn,DatasetRetAnn,'x');
 axis('on')
 
 
 
 
 
 
toc         
              

    
    
    
    
    