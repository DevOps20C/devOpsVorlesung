import pytest
from devops.app import app as test_app
from werkzeug.test import Client


@pytest.fixture()
def flask_app():
    flask_app = test_app
    return flask_app


@pytest.fixture()
def client(flask_app):
    return Client(flask_app)


@pytest.fixture()
def runner(flask_app):
    return flask_app.test_cli_runner()


def test_start_screen(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b'Hello DHBW - Python Quickstart' in response.data


def test_hello_screen(client):
    response = client.post('/hello', data=dict(name='Erdbeermarmeladenbrot'))
    assert response.status_code == 200
    assert b'Hello Erdbeermarmeladenbrot' in response.data


def test_hello_screen_no_name(client):
    response = client.post('/hello', data=dict(name=''))
    assert response.status_code == 302
    assert b'Hello' not in response.data
