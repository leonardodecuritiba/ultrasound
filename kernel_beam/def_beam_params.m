function BEAM = def_beam_params(matrix, ussys)
% ============================================================
BEAM.x_values = matrix.roi_x_values; % Posi��es no eixo x da imagem resultante [m]
BEAM.z_values = matrix.roi_z_values; % Posi��es no eixo z da imagem resultante [m]
BEAM.roi_pixels = matrix.roi_pixels; % Pixels
BEAM.c = ussys.sound_speed; % Velocidade do som no meio [m/s]
BEAM.fs = ussys.sampling_frequency; % Frequencia de amostragem [Hz]
BEAM.signal = ussys.impulse_response.signal; % Sinal transmitido
BEAM.Ne = ussys.aperture_physical_Ne; % N�mero de elementos sensores
BEAM.samples_init = matrix.roi_sample_init; % N�mero de amostras inicias
BEAM.aperture_element_pos = ussys.aperture_element_pos; % N�mero de amostras inicias
BEAM.pixels = [size(BEAM.x_values) 0 size(BEAM.z_values)]; % N�mero de amostras inicias
% ============================================================
