const apiURL = `http://localhost:8080/CampusCoRide_war/services/api`;
let lat = document.getElementById('lat');
let lng = document.getElementById('lng');

const rideFormInit = (e) => {
    const locationField = document.getElementById('locationName');
    locationField.addEventListener('input', getPredictions);

    const submitBtn = document.getElementById('submitRequest');
    submitBtn.addEventListener('click', submitRequestFormListener);
};

const getPredictions = async (e) => {
    const input = e.target.value;
    if (!input.trim()) {
        clearPredictionsList();
        return;
    }

    const data = await predictionsFetch(input);
    clearPredictionsList();
    data.forEach((prediction) => {
        createListItem(prediction.place_id, prediction.description);
    });
};

const createPredictionsList = () => {
    let ul = document.getElementById('predictions-list');
    if (!ul) {
        ul = document.createElement('ul');
        ul.id = 'predictions-list';
        document.getElementById('autocompleteResults').appendChild(ul);
    }
    return ul;
};

const clearPredictionsList = () => {
    const ul = document.getElementById('predictions-list');
    if (ul) ul.innerHTML = '';
};

const createListItem = (id, description) => {
    const ul = createPredictionsList();
    const li = document.createElement('li');
    li.id = id;
    li.textContent = description;
    li.addEventListener('click', async () => {
        const data = await predictionsItemSelectedListener(id, description);
    });
    ul.appendChild(li);
};

const predictionsItemSelectedListener = async (placeId, description) => {
    let result = await placeDetailsFetch(placeId);

    let ul = document.getElementById('predictions-list');
    ul.innerHTML = '';

    let locationField = document.getElementById('locationName');
    locationField.value = '';
    locationField.value = description;

    let lat = document.getElementById('lat');
    lat.value = result.geometry.location.lat;

    let lng = document.getElementById('lng');
    lng.value = result.geometry.location.lng;
};

const submitRequestFormListener = async (e) => {
    e.preventDefault();
    e.stopImmediatePropagation();

    let form = document.getElementById('requestForm');

    let location = {
        locationName: form.elements['locationName'].value || '',
        lat: form.elements['lat'].value,
        lng: form.elements['lng'].value
    };

    let rideForm = {
        roleType: form.elements['roleType'].value,
        requestType: form.elements['requestType'].value,
        date: form.elements['date'].value || null,
        time: form.elements['time'].value + ':00' || null,
        notes: form.elements['notes'].value || null,
    }

    await checkForSubmitSuccess(location, rideForm);
}

const checkForSubmitSuccess = async (location, rideForm) => {
    let postLocation = await submitFormFetch(location,'submit-location');
    if (postLocation) {
        let locationId = postLocation.id;

        let postRideForm = await submitFormFetch(rideForm, `submit-requestForm/${locationId}`);
        if (postRideForm) {
            let form = document.getElementById('requestForm');
            form.submit();
        }
    }
}

const submitFormFetch = async (locationObj, uri) => {
    const response = await fetch(`${apiURL}/${uri}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(locationObj)
    });
    const result = await response.json();
    return await result;
}

const predictionsFetch = async (input) => {
    const url = `${apiURL}/autocomplete/${encodeURIComponent(input)}`;
    const response = await fetch(url);
    return await response.json();
};

const placeDetailsFetch = async (placeId) => {
    const url = `${apiURL}/details/${encodeURIComponent(placeId)}`;
    const response = await fetch(url);
    return await response.json();
};

window.onload = rideFormInit;
