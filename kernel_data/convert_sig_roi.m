function data_aux = convert_sig_roi(roi_init, roi_size, data_init, data)

[S, Ne] = size(data); % S: Signal size in samples; Ne: Sensor quantities
data_aux = zeros(roi_size, Ne); % data_aux CONT�M O SINAL FINAL

sig_ind_end = data_init + S; % Signal end in samples [time-pixels]
roi_ind_end = roi_init + roi_size;

DIFF_I = sig_ind_end - roi_init; % Diferen�a entre os �ndices do fim do sinal e in�cio da ROI
DIFF_F = roi_ind_end - data_init; % Diferen�a entre os �ndices do fim da ROI e in�cio do sinal

if(DIFF_I > 0 && DIFF_F > 0) % Sinal dentro;
    if(sig_ind_end <= roi_ind_end)            
        if(data_init <= roi_init) % SITUA��O 2 - Sinal ainda n�o entrou tudo
            data_aux(1:DIFF_I,:) = data(roi_init - data_init + 1:end,:);
        else
            ini_data = data_init - roi_init;
            end_data = ini_data+S;
            data_aux(ini_data:end_data-1,:) = data(:,:); % SITUA��O 3 - Sinal entrou tudo
        end
    else
        if(data_init > roi_init) 
            data_aux((data_init - roi_init + 1):end,:) = data(1:(roi_size - (data_init - roi_init)),:); % SITUA��O 4 - Sinal est� saindo
        else
            data_aux = data((roi_init - data_init + 1):(roi_init - data_init)+roi_size,:); % SITUA��O 6 - Sinal � maior que a roi e j� entrou
        end
    end    
end % Sinal est� fora
