SELECT requests.id, requests.date_update, equipments.name as equipment_name, type_of_malfunctions.name as type_of_malfunction_name, 
requests.description_of_problem, users.last_name as user_last_name, executors.last_name as executor_last_name, prioritets.name as prioritet_name, 
statuses_request.name as statuses_request_name
FROM requests, equipments, type_of_malfunctions, users, prioritets, statuses_request, executors
WHERE requests.equipment_id = equipments.id
AND requests.type_of_malfunction_id = type_of_malfunctions.id
AND requests.user_id = users.id
AND requests.prioritet_id = prioritets.id
AND requests.status_request_id = statuses_request.id
AND requests.executor_id = executors.id

