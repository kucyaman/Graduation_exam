'use client';

import Image from 'next/image'
import { useSession } from 'next-auth/react';
import Login from './components/Login';
import Logout from './components/Logout';

export default function Home() {
	const { data: session, status } = useSession();
	return (
		<div>
			{status === 'authenticated' ? (
				<div>
					<p>セッションの期限：{session.expires}</p>
					<p>ようこそ、{session.user?.name}さん</p>
					<Image
				    src={session.user?.image ?? ``}
				    alt=""
				    width={100} // ここに幅を指定
				    height={100} // ここに高さを指定
				    style={{ borderRadius: '50px' }}
				/>
					<div>
						<Logout />
					</div>
				</div>
			) : (
				<Login />
			)}
		</div>
	);
}