/*
 *   Famedly Matrix SDK
 *   Copyright (C) 2019, 2020 Famedly GmbH
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU Affero General Public License as
 *   published by the Free Software Foundation, either version 3 of the
 *   License, or (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU Affero General Public License for more details.
 *
 *   You should have received a copy of the GNU Affero General Public License
 *   along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:test/test.dart';

import 'package:matrix/matrix.dart';
import 'fake_matrix_api.dart';

// TODO adapt fake_matrix_api.dart

//void main() {
//  /// All Tests related to the Event
//  group('Restricted join rules', () {
//    Logs().level = Level.error;
//    final client = Client('testclient', httpClient: FakeMatrixApi());
//    final room = Room(id: '!localpart2:server.abc', client: client);
//
//    setUp(() async {
//      await client.checkHomeserver(Uri.parse('https://fakeserver.notexisting'),
//          checkWellKnown: false);
//      await client.login(LoginType.mLoginPassword,
//          identifier: AuthenticationUserIdentifier(user: 'test'),
//          password: '1234');
//    });
//    tearDown(() async {
//      await client.logout();
//    });
//    test('multiple rooms in restricted join_rule', () async {
//      await room.setRestrictedJoinRules(
//          ['#DE--uuid1:server.abc', '#DE--uuid2:server.abc']);
//      expect(room.restrictedJoinRulesAllowedRooms,
//          ['#DE--uuid1:server.abc', '#DE--uuid2:server.abc']);
//    });
//    test('reset restricted join_rule', () async {
//      await room.setRestrictedJoinRules([]);
//      expect(room.restrictedJoinRulesAllowedRooms, []);
//    });
//    test('adding rooms multiple times in restricted join_rule', () async {
//      await room.addToRestrictedJoinRules(['#DE--uuid1:server.abc']);
//      await room.addToRestrictedJoinRules(['#DE--uuid2:server.abc']);
//      await room.addToRestrictedJoinRules(
//          ['#DE--uuid3:server.abc', '#DE--uuid4:server.abc']);
//      expect(room.restrictedJoinRulesAllowedRooms, [
//        '#DE--uuid1:server.abc',
//        '#DE--uuid2:server.abc',
//        '#DE--uuid3:server.abc',
//        '#DE--uuid4:server.abc'
//      ]);
//    });
//    test('removing a group from restricted join_rule', () async {
//      await room.removeGroupFromJoinRules('#DE--uuid3:server.abc');
//      expect(room.restrictedJoinRulesAllowedRooms, [
//        '#DE--uuid1:server.abc',
//        '#DE--uuid2:server.abc',
//        '#DE--uuid4:server.abc'
//      ]);
//    });
//    test('removing another group from restricted join_rule', () async {
//      await room.removeGroupFromJoinRules('#DE--uuid1:server.abc');
//      expect(room.restrictedJoinRulesAllowedRooms, [
//        '#DE--uuid2:server.abc',
//        '#DE--uuid4:server.abc'
//      ]);
//    });
//    test('dispose client', () async {
//      await Future.delayed(Duration(milliseconds: 50));
//      await client.dispose(closeDatabase: true);
//    });
//  });
//}
